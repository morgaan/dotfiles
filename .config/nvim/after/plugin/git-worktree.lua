local Worktree = require("git-worktree")

Worktree.setup({
    change_directory_command = 'tcd' -- default: "cd", `tcd` if you want to only change the `pwd` for the current vim Tab.
    -- update_on_change = <boolean> -- default: true,
    -- update_on_change_command = <str> -- default: "e .",
    -- clearjumps_on_change = <boolean> -- default: true,
    -- autopush = <boolean> -- default: false,
})

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted
Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Switch then
    print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
  end
  if op == Worktree.Operations.Create then
    print("Created worktree " .. metadata.path .. " with branch " .. metadata.branch .. " and from origin " .. metadata.upstream)
  end
  if op == Worktree.Operations.Delete then
    print("Deleted worktree " .. metadata.path)
  end
end)
