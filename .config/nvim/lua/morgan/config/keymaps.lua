local keymap = vim.keymap.set

vim.g.mapleader = " "

-- keymap('n', '--', vim.cmd.Ex, { desc = 'Open current file\'s parent folder in netrw' })

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

keymap('n', '[s', 'i<Space><Esc>l', { desc = 'Insert a space before the current character' })
keymap('n', ']s', 'a<Space><Esc>h', { desc = 'Insert a space after the current character' })

keymap('n', 'n', 'nzz', { desc = 'Scroll cursor to middle after searching for next search term occurence' })
keymap('n', 'N', 'Nzz', { desc = 'Scroll cursor to middle after searching for previous search term occurence' })
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll cursor to middle after half page jump downward' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll cursor to middle after half page jump upward' })
keymap('n', ']q', '<cmd>cn<CR>zz', { remap = true, desc = 'Scroll cursor to middle after a quickfix jump forward' })
keymap('n', '[q', '<cmd>cN<CR>zz', { remap = true, desc = 'Scroll cursor to middle after a quickfix jump backward' })
keymap('n', '=ie', '<Plug>(textobj-entire-i)``zz', { silent = true, desc = 'Scroll cursor to middle after re-indent the entire buffer' })

keymap('n', '<leader>np', ':!notes p<CR><CR>', { desc = '[N]otes changes are being [P]ushed]' })
keymap('n', '<leader>nf', ':!notes f<CR><CR>', { desc = '[N]otes changes are being [F]etched' })

keymap('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move visual selection downward' })
keymap('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move visual selection upward' })

keymap('n', '<leader>f', ':Ack!<space>', { desc = 'Grep (using Ack) through files of certain type when --filetype appended to search term' })

keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = '[M]arkdown [P]review in browser' })

-- Close all other buffers but current
keymap('n', '<leader>co', ':w|%bd<CR><C-O>:bd#<CR>', { desc = '[C]lose all [O]ther buffer but current' })

