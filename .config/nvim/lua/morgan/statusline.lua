-- Preview
-- -------------------------------------------------
-- W1・<vim>       master・☰ 98%・362,1  .vimrc [+]
-- -------------------------------------------------
local stl = {
  '%#StatuslineCustom#',
  ' W%{winnr()}・',
  '%{len(&filetype)?"<".&filetype.">":""}',
  '%=',
  '%{exists("g:loaded_fugitive")&&len(FugitiveHead())?" ".FugitiveHead():""}',
  '・☰ ',
  '%P・',
  '%l,',
  '%c',
  ' ',
  '%#StatuslineFilename#',
  ' %t ',
  '%#ErrorMsg#%m'
}

vim.o.statusline = table.concat(stl)
