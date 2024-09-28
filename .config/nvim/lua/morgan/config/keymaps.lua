local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap('n', '<leader>tr', '<cmd>set relativenumber!<CR>', { desc = '[T]oggle [R]elativenumber' })

keymap('n', 'gcp', '<cmd>let @+=@%<CR>', { desc = '[G]et [C]urrent [P]ath into system clipboard' })

keymap('n', 'j', 'gj', { desc = 'Move downward by visual line rather than by line' })
keymap('n', 'k', 'gk', { desc = 'Move upward by visual line rather than by line' })

keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Easier quit buffer' })
keymap('n', '<leader>w', '<cmd>write<CR>', { desc = 'Easier write buffer' })
keymap('n', '<leader>wq', '<cmd>wq<CR>', { desc = 'Easier write and quit buffer' })

keymap('', '<C-h>', '<C-w>h', { desc = 'Easier window navigation toward left' })
keymap('', '<C-j>', '<C-w>j', { desc = 'Easier window navigation toward down' })
keymap('', '<C-k>', '<C-w>k', { desc = 'Easier window navigation toward up' })
keymap('', '<C-l>', '<C-w>l', { desc = 'Easier window navigation toward right' })

keymap('n', '<S-right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase width of current split by 2 columns' })
keymap('n', '<S-left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease width of current split by 2 columns' })
keymap('n', '<S-down>', '<cmd>resize -2<CR>', { desc = 'Increase height of current split by 2 columns' })
keymap('n', '<S-up>', '<cmd>resize +2<CR>', { desc = 'Decrease height of current split by 2 columns' })

keymap('n', '<leader>gs', '<cmd>Ge :<CR>', { desc = 'Open [GS]tatus on the current window' })

keymap('n', '<leader>1', '<cmd>s/false/true/<CR>', { desc = 'Swap first occurrence of false with true' })
keymap('n', '<leader>0', '<cmd>s/true/false/<CR>', { desc = 'Swap first occurrence of true with false' })

keymap('n', '<leader>l', '<cmd>set list!<CR>', { remap = true, desc = 'Toggle showing tabs and spaces characters using set [l]ist' })
keymap('n', '<leader>c', '<cmd>let &cole=(&cole == 2) ? 0 : 2 <bar> echo \'conceallevel \' . &cole <CR>', { desc = 'Toggle [C]onceallevel'})

keymap('n', '<leader>cb', '<cmd>!git cp<CR><CR>', { desc = '[C]opy current git [B]ranch to system clipboard' })

keymap('n', '[<tab>', 'i<Space><Esc>l', { desc = 'Insert a space before the current character' })
keymap('n', ']<tab>', 'a<Space><Esc>h', { desc = 'Insert a space after the current character' })

keymap('n', 'n', 'nzz', { desc = 'Scroll cursor to middle after searching for next search term occurence' })
keymap('n', 'N', 'Nzz', { desc = 'Scroll cursor to middle after searching for previous search term occurence' })
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll cursor to middle after half page jump downward' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll cursor to middle after half page jump upward' })
keymap('n', ']q', '<cmd>cn<CR>zz', { remap = true, desc = 'Scroll cursor to middle after a quickfix jump forward' })
keymap('n', '[q', '<cmd>cN<CR>zz', { remap = true, desc = 'Scroll cursor to middle after a quickfix jump backward' })
keymap('n', '=ie', '<Plug>(textobj-entire-i)``zz', { silent = true, desc = 'Scroll cursor to middle after re-indent the entire buffer' })

keymap('n', '<leader>np', ':!sb p<CR>', { desc = '[N]otes changes from Second Brain are being [P]ushed]' })
keymap('n', '<leader>nf', ':!sb f<CR>', { desc = '[N]otes changes from Second Brain are being [F]etched' })

keymap('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move visual selection downward' })
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move visual selection upward' })

keymap('n', '<leader>f', ':Ack!<space>', { desc = 'Grep (using Ack) through files of certain type when --filetype appended to search term' })

keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = '[M]arkdown [P]review in browser' })
keymap('n', '<leader>rl', 'F["_d%.i', { desc = '[R]eplace Markdown [L]ink' })
keymap('v', '<leader>h', '<Esc>`>a==<C-o>`<==<Esc>`>5l', { desc = 'Add a "markdown" [H]ighlight to visual selection' })

-- Noice
keymap("n", "<leader>dn", ":NoiceDismiss<CR>", { noremap = true, desc = '[D]ismiss [N]otifications' })

-- Oil.nvim
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory with Oil.nvim" })

-- Obsidian
keymap("n", "<leader>ov", ":e ~/second-brain<CR>", { noremap = true, desc = 'Browse to [O]bsidian [V]ault' })
keymap("n", "<leader>on", ":ObsidianNew<CR>", { noremap = true, desc = '[O]bsidian [N]ew' })
keymap("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", { noremap = true, desc = '[O]bsidian [Q]uickSwitch' })
keymap("n", "<leader>oo", ":ObsidianOpen<CR>", { noremap = true, desc = '[O]bsidian [O]pen' })
keymap("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, desc = '[O]bsidian grep [S]earch' })
keymap("n", "<leader>ot", ":ObsidianTemplate<CR>", { noremap = true, desc = '[O]bsidian [T]emplate' })
keymap("n", "<leader>oh", ":ObsidianTags<CR>", { noremap = true, desc = '[O]bsidian [H]ashtags' })
keymap("n", "<leader>ob", ":ObsidianBacklinks<CR>", { noremap = true, desc = '[O]bsidian note [B]acklinks' })
keymap("n", "<leader>ol", ":ObsidianLinks<CR>", { noremap = true, desc = '[O]bsidian note [L]inks' })
keymap("v", "<leader>oe", ":ObsidianExtractNote<CR>", { noremap = true, desc = '[O]bsidian [E]xtract' })
keymap("n", "<leader>oi", ":ObsidianPasteImg<CR>", { noremap = true, desc = '[O]bsidian [I]nsert Image from clipboard' })
keymap("n", "<leader>ox", ":ObsidianFollowLink<CR>", { noremap = true, desc = '[O]bsidian follow link the cursor is on. NOTE: <CR> does the same!' })

-- Close all other buffers but current
keymap('n', '<leader>co', ':w|%bd<CR><C-O>:bd#<CR>', { desc = '[C]lose all [O]ther buffer but current' })

