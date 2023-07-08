local luasnip = require('luasnip')

luasnip.filetype_extend("javascript", { "jsdoc" })

require('luasnip.loaders.from_vscode').lazy_load()
