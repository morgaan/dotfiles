-- =============================================================================
-- TITLE : vim-case-convert
-- ABOUT : Makes it easy to switch whole files between snake case, hyphenation
-- and camel case.
-- LINKS :
--   > github: https://github.com/chiedo/vim-case-convert
--  USAGE:
--   > :CamelToHyphen
--   > :CamelToSnake
--   > :HyphenToCamel
--   > :HyphenToSnake
--   > :SnakeToCamel
--   > :SnakeToHyphen
--
--   in ALL lines spanned by the visual selection
--   > :CamelToHyphenSel
--   > :CamelToSnakeSel
--   > :HyphenToCamelSel
--   > :HyphenToSnakeSel
--   > :SnakeToCamelSel
--   > :SnakeToHyphenSel
--
--   all occurences
--   > :CamelToHyphenAll
--   > :CamelToSnakeAll
--   > :HyphenToCamelAll
--   > :HyphenToSnakeAll
--   > :SnakeToCamelAll
--   > :SnakeToHyphen
-- =============================================================================
return {
	{
		"chiedo/vim-case-convert",
		event = { "BufReadPre", "BufNewFile" },
	},
}
