#!/bin/sh -
# SPDX-License-Identifier: 0BSD
# Copyright 2021 Alexander Kozhevnikov <mentalisttraceur@gmail.com>

initialize()
{
    git log -n1 --pretty=format:'' || return 1
    base=`git branch --show-current` || return 1
    case $base in '')
        base=`git rev-parse HEAD` || return 1
    esac
    root=`git rev-parse --show-toplevel` || return 1
    cd "$root" || return 1
    case `git rev-parse --git-common-dir` in .git) :;; *)
        error_missing_git_directory; return 1
    esac
    git diff --staged --quiet
    case $? in 1)
        had_staged_changes=true
        git commit --quiet --message 'git-cotree temporary commit' || return 1
    esac
    git config --local core.bare true || return 1
    directory=`mktemp -d git-cotree-XXXXXX` || return 1
    chmod =rwx "$directory" || return 1
    git worktree add --no-checkout --quiet "$directory" "$base" || return 1
    for name in * .*
    do
        case $name in "$directory" | .. | . | .git) :;; *)
            mv ./"$name" "$directory"/ || return 1
        esac
    done
    cd "$directory" || return 1
    git reset --quiet HEAD || return 1
    case $had_staged_changes in true)
        git reset --soft --quiet HEAD~1 || return 1
    esac
    cd "$root" || return 1
    case $base in ?*/*)
        mkdir -p "${base%/*}" || return 1
    esac
    git worktree move "$directory" "$base" || return 1
}

create()
{
    case $# in 0) error_need_co_tree; return 1; esac
    root=`find_cotree_root` || return 1
    directory=`_resolve_directory "$root" "$1"` || return 1
    case $# in 1)
        git worktree add "$root/$directory" "$directory" 2>/dev/null \
        || git worktree add "$root/$directory" -b "$directory" \
        || return 1
        return 0
    esac
    git worktree add "$root/$directory" -b "$directory" "$2" || return 1
}

delete()
{
    case $# in 0) error_need_co_tree; return 1; esac
    root=`find_cotree_root` || return 1
    directory=`_resolve_directory "$root" "$1"` || return 1
    base=`git -C "$root" branch --show-current` || return 1
    branch=`
        cd "$root/$directory" 2>/dev/null || exit 0
        _in_repository_after_cd "$root" "$directory" || exit 1
        git branch --show-current 2>/dev/null || exit 0
    ` || return 1
    git worktree remove $force "$root/$directory" || return 1
    _clean_up_if_cotree_name_had_slashes || return 1
    case $branch in "$base") :;; ?*)
        git branch --delete $force "$branch" || return 1
    esac
}

base()
{
    case $# in 0) error_need_commit_ish_or_co_tree; return 1; esac
    root=`find_cotree_root` || return 1
    base=`_resolve_directory "$root" "$1"` || return 1
    cd "$root" || return 1
    case $1 in . | .. | ./* | ../*) :;; *)
        ref=refs/heads/$base
        if git show-ref --verify --quiet "$ref"
        then
            git symbolic-ref HEAD "$ref" || return 1
            return 0
        elif commit=`git rev-parse --verify --quiet "$base^{commit}"`
        then
            git update-ref --no-deref HEAD "$commit" || return 1
            return 0
        fi
    esac
    cd "$root/$base" || return 1
    _in_repository_after_cd "$root" "$base" || return 1
    branch=`git branch --show-current` || return 1
    case $branch in
    ?*)
        git -C "$root" symbolic-ref HEAD "refs/heads/$branch" || return 1
    ;;
    '')
        commit=`git rev-parse HEAD` || return 1
        git -C "$root" update-ref --no-deref HEAD "$commit" || return 1
    esac
}

collapse()
{
    case $# in 0) error_need_co_tree; return 1; esac
    root=`find_cotree_root` || return 1
    directory=`_resolve_directory "$root" "$1"` || return 1
    cd "$root/$directory" || return 1
    _in_repository_after_cd "$root" "$directory" || return 1
    branch=`git branch --show-current` || return 1
    case $branch in
    ?*)
        git -C "$root" symbolic-ref HEAD "refs/heads/$branch" || return 1
    ;;
    '')
        commit=`git rev-parse HEAD` || return 1
        git -C "$root" update-ref --no-deref HEAD "$commit" || return 1
    esac
    temporary=`mktemp -d git-cotree-XXXXXX` || return 1
    chmod =rwx "$temporary" || return 1
    for name in * .*
    do
        case $name in "$temporary" | .. | . | .git) :;; *)
            mv ./"$name" "$temporary"/ || return 1
        esac
        touch "$temporary/$temporary" "$temporary"/.git || return 1
    done
    mv "$temporary" "$root"/ || return 1
    cd "$root" || return 1
    git worktree remove --force "$root/$directory" || return 1
    _clean_up_if_cotree_name_had_slashes || return 1
    cd "$root/$temporary" || return 1
    for name in * .*
    do
        case $name in "$temporary" | .. | . | .git) :;; *)
            mv ./"$name" "$root"/ || return 1
        esac
    done
    cd "$root" || return 1
    rm -r "$temporary" || return 1
    git config --local core.bare false || return 1
}

find_cotree_root()
{
    prefix=`git rev-parse --show-prefix` || return 1
    while :
    do
        case $prefix in
        ?*)
            cd .. || return 1
            prefix=${prefix#*/}
        ;;
        '')
            worktree=`git rev-parse --is-inside-work-tree` || return 1
            case $worktree in true)
                cd .. || return 1
                if prefix_or_error=`git rev-parse --show-prefix 2>&1`
                then
                    prefix=$prefix_or_error
                    continue
                fi
                error=$prefix_or_error
                case $error in 'fatal: not a git repository '*)
                    error=${error#'fatal: not a git repository'}
                    error='fatal: not a git co-tree repository'$error
                esac
                printf '%s\n' "$error" 1>&2; return 1
            esac
            break
        esac
    done
    pwd || return 1
}

_resolve_directory()
{
    directory=$2
    while :
    do
        case $directory in *//*)
            directory=${directory%%//*}/${directory#*//}
            continue
        esac
        break
    done
    case $directory in ../* | ./* | .. | .)
        while :
        do
            case $directory in
            ../* | ..)
                current=`pwd` || return 1
                case $current in "$1"/?*)
                    cd .. || return 1
                    directory=${directory#..}
                    directory=${directory#/}
                    continue
                esac
            ;;
            ./* | .)
                directory=${directory#.}
                directory=${directory#/}
                continue
            esac
            break
        done
        current=`pwd` || return 1
        case $current in "$1"/?*)
            directory=${current#"$1"/}/$directory
        esac
    esac
    directory=${directory%/}
    printf '%s\n' "$directory"
}

_in_repository_after_cd()
{
    current=`pwd` || return 1
    case $current in "$1" | "$1"/?*)
        return 0
    esac
    error_outside_repository "$1/$2"; return 1
}

_clean_up_if_cotree_name_had_slashes()
{
    current=`pwd` || return 1
    case "$root/$directory" in "$current"/?*) :;; *)
        cd "$root" || return 1
    esac
    while :
    do
        case $directory in */*)
            directory=${directory%/*}
            current=`pwd` || return 1
            case "$root/$directory" in "$current"/?*)
                if error=`rmdir "$root/$directory" 2>&1`
                then
                    continue
                else
                    if _directory_is_empty "$root/$directory"
                    then
                        printf '%s\n' "$error" 1>&2; return 1
                    fi
                    break
                fi
            esac
        esac
        break
    done
}

_directory_is_empty()
{
    cd "$1" || return 1
    for file in *
    do
        case $file in '*') :;; *) return 1; esac
    done
    for file in ?
    do
        case $file in '?') :;; *) return 1; esac
    done
    for file in .*
    do
        case $file in . | ..) :;; *) return 1; esac
    done
    return 0
}

error_missing_git_directory()
{
    printf '%s\n' 'fatal: missing .git directory' 1>&2
}

error_need_commit_ish_or_co_tree()
{
    printf '%s\n' 'fatal: need commit-ish or co-tree argument' 1>&2
}

error_outside_repository()
{
    printf '%s\n' "fatal: outside repository: $1" 1>&2
}

error_need_co_tree()
{
    printf '%s\n' 'fatal: need co-tree argument' 1>&2
}

bad_option()
{
    printf '%s\n' "fatal: bad option: $1" 1>&2
}

help()
{
    printf '%s' \
'Usage:
    git-cotree <co-tree> [<commit-ish>]
    git-cotree --delete [--force] <co-tree>
    git-cotree --initialize
    git-cotree --base (<commit-ish> | <co-tree>)
    git-cotree --show-root
    git-cotree --collapse <co-tree>

Options:
    -h --help --usage       show this help text
    -i --init --initialize  set up for using co-trees
    -d --delete             delete this co-tree
    -f --force              force deleting this co-tree
    -D                      short for both --delete and --force
    -b --base               set the default base for new co-tree branches
    --show-root             show absolute path of co-tree repository root
    -c --collapse           collapse this co-tree into the repository root
' || return 1
}

force=
action=create
for argument
do
    case $argument in
    -h | --help | --usage) help; exit $?;;
    -i | --init | --initialize) action=initialize;;
    -b | --base) action=base;;
    -c | --collapse) action=collapse;;
    -d | --delete) action=delete;;
    -f | --force) force=--force;;
    -fd | -df | -D) force=--force && action=delete;;
    --show-root) action=find_cotree_root;;
    -*) bad_option "$1"; exit 1;;
    *) break;;
    esac
    shift 1
done
"$action" "$@"

