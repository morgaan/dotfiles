return {
	'mustache/vim-mustache-handlebars',
	event = {'BufReadPre', 'BufNewFile'},
	config = function()
		local global = vim.g

		-- Out of the box
		-- ]] jumps to the first following tag
		-- [[ jumps to the first previous tag 
		-- Count with section movements is supported:
		-- 2]] jumps to the second next tag

		-- Enables abbreviations like:
		--
		-- {{# produces
		-- {{# _}}
		-- {{/}}
		-- 
		-- {{if produces
		-- {{#if _}}
		-- {{/if}}
		-- 
		-- {{ife produces
		-- {{#if _}}
		-- {{else}}
		-- {{/if}}
		global.mustache_abbreviations = 1

		-- Enables text-objects
		--
		-- `ie` and `ae` (mnemonic e for element)
		global.mustache_operators = 1 -- Default
	end
}
