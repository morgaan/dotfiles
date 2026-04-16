-- https://github.com/obsidian-nvim/obsidian.nvim
return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	-- Only want to load obsidian.nvim for markdown files in my vault:
	event = {
		-- home shortcut '~' here you need to call 'vim.fn.expand'.
		"BufReadPre " .. vim.fn.expand "~" .. "/second-brain/**.md",
		"BufReadPre oil://" .. vim.fn.expand "~" .. "/second-brain/**",
		"BufNewFile " .. vim.fn.expand "~" .. "/second-brain/**.md",
	},
	ft = "markdown",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
		{
				name = "Second Brain",
				path = "~/second-brain",
			},
		},
		-- This allows to create any new notes in the Inbox thanks to
		-- new_notes_location that is being pointed to notes_subdir.
		-- Luckily this has no impact on the obsidian search as it is still
		-- searching the entire vault.
		notes_subdir = "+",
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "notes_subdir",

		note = {
			template = "default-template.md"
		},

		link = {
			format = "absolute",
			-- Type [[query to get the dropdown and pick the one with the alias
			-- you want
			style = "markdown",
			auto_update = false,
		},

		completion = (function()
			local has_nvim_cmp, _ = pcall(require, "cmp")
			local has_blink = pcall(require, "blink.cmp")
			return {
				-- Set to false to disable completion.
				nvim_cmp = has_nvim_cmp and not has_blink,
				blink = has_blink,
				min_chars = 3,
				match_case = true,
				create_new = true,
			}
		end)(),

		picker = {
			name = "telescope.nvim",
			note_mappings = {
				-- Create a new note from your query.
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},

		frontmatter = {
			enabled = function(path)
				if vim.endswith(tostring(path), "-template.md") then -- disables the frontmatter when it is a template file
					return false
				end
				return true
			end,
			func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
					note:add_alias(note.title)
				end

				local out = { aliases = note.aliases, date = os.date("%Y-%m-%d") }

				if #note.tags >= 1 then
					out["tags"] = note.tags
				end

				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
			-- sort = { "id", "aliases", "tags" },
		},

		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title == nil then
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			else
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			end
			-- return tostring(os.time()) .. "-" .. suffix
			return suffix
		end,

		templates = {
			enable = true,
			folder = "x/templates/nvim",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {
				year = function()
					return os.date("%Y", os.time())
				end,
			},
		},

		backlinks = {
			parse_headers = true,
		},

		-- Specify how to handle attachments.
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			folder = "x/attachments",
			img_name_func = function()
				return string.format("Pasted image %s", os.date "%Y%m%d%H%M%S")
			end,
			img_text_func = function(path)
				return string.format("![Add alt text](%s)", path)
			end,
			confirm_img_paste = false,
		},

		statusline = {
			enabled = false,
		},

		ui = {
			-- Let render-markdown take over
			enable = false,
		},
	},
}
