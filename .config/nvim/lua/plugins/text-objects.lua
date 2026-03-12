return {
	{
		'wellle/targets.vim',
		event = {'BufReadPre', 'BufNewFile'}
	},
	{
		'michaeljsmith/vim-indent-object',
		event = {'BufReadPre', 'BufNewFile'}
	},
	{
		'kana/vim-textobj-entire',
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {'kana/vim-textobj-user'}
	},
	{
		'jceb/vim-textobj-uri',
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {'kana/vim-textobj-user'}
	},
	{
		'kana/vim-textobj-line',
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {'kana/vim-textobj-user'}
	},
	{
		'whatyouhide/vim-textobj-xmlattr',
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {'kana/vim-textobj-user'}
	},
}
