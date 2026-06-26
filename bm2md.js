#!/usr/bin/env node

/**
 * Usage:
 *
 * Pre-requisites:
 * - Have Node.js installed
 * - Have a Firefox bookmarks JSON backup (In FF, Ctrl + O, Import and Backup,
 *   Backup ..., save file to disk
 * - This current file is added to you dotfiles directory
 * - Add alias to your shell config, e.g. in .zshrc, alias="~/dotfiles/bm2md.js"
 * - Source the file
 *
 * Commands:
 * - bm2md ./bookmarks-YYYY-MM-DD.json
 * - bm2md ./bookmarks-YYYY-MM-DD.json | xclip -sel clip (to output to clipboard on X11)
 */

const {resolve} = require('node:path');
const bookmarksFile =
	process.argv.length > 2 ? resolve(process.argv[2]) : undefined;

if (!bookmarksFile) {
	console.error(
		'❌ Please provide a valid path to bookmarks JSON export (e.g. ./bookmarks-2026-06-24.json)'
	);

	process.exit(1);
}

let bookmarks;

try {
	bookmarks = require(bookmarksFile).children.filter(
		(child) => child.title === 'toolbar'
	)[0];
} catch (error) {
	console.error('Something went wrong', error);

	process.exit(1);
}

function collectNode(node, level, accumulator) {
	const {title, uri, type, children} = node;

	if (children?.length > 0) {
		const heading =
			level === 1
				? '# My Firefox bookmarks'
				: `${'#'.repeat(level)} ${title}`;

		accumulator.push(`\n ${heading}\n`);

		for (const child of children) {
			collectNode(child, level + 1, accumulator);
		}
	} else {
		if (type === 'text/x-moz-place-separator') {
			accumulator.push(`\n---\n`);
		} else if (uri) {
			accumulator.push(`- [${title}](${uri})`);
		}
	}
}

const markdown = [];

collectNode(bookmarks, 1, markdown);

console.log(markdown.join('\n'));
