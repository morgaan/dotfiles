return {
	{
		'wellle/targets.vim',
		event = { 'BufReadPre', 'BufNewFile' }
	},
	{
		'michaeljsmith/vim-indent-object',
		event = { 'BufReadPre', 'BufNewFile' }
	},
	{
		'kana/vim-textobj-entire',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'kana/vim-textobj-user' }
	},
	{
		'jceb/vim-textobj-uri',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'kana/vim-textobj-user' }
	},
	{
		'kana/vim-textobj-line',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'kana/vim-textobj-user' }
	},
	{
		'whatyouhide/vim-textobj-xmlattr',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'kana/vim-textobj-user' }
	},
	{
		-- https://github.com/preservim/vim-textobj-quote
		-- Beware: There is a command in my commands to enable this plugin on
		-- Markdown files
		'preservim/vim-textobj-quote',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'kana/vim-textobj-user' }
	},
}
