-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Gitsigns: [H]unk [S]tage' })
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Gitsigns: [H]unk [R]eset' })
    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Gitsigns: [S]tage buffer' })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Gitsigns: [H]unk [U]ndo stage' })
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Gitsigns: [R]eset buffer' })
    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Gitsigns: [H]unk [P]review' })
    map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'Gitsigns: [H]unk [B]lame' })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Gitsigns: [T]oggle current line [B]lame' })
    map('n', '<leader>hd', gs.diffthis, { desc = 'Gitsigns: [H]unk [D]iff' })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Gitsigns: Buffer [D]iff' })
    map('n', '<leader>td', gs.toggle_deleted, { desc = 'Gitsigns: [T]oggle [D]elete' })

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns: [I]nner [H]unk' })
  end
}

