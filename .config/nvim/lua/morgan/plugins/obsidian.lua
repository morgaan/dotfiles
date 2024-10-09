-- https://github.com/epwalsh/obsidian.nvim
return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  event = "VeryLazy",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Second Brain",
        path = "~/second-brain",
      }
    },

	-- This allows to create any new notes in the Inbox thanks to
	-- new_notes_location that is being pointed to notes_subdir.
	-- Luckily this has no impact on the obsidian search as it is still
	-- searching the entire vault.
	notes_subdir = "0-Inbox",

	-- Completion of wiki links, local markdown links, and tags using nvim-cmp.
	completion = {
		-- Set to false to disable completion.
		nvim_cmp = true,
		-- Trigger completion at 2 chars.
		min_chars = 2,
	},

	preferred_link_style = "markdown",

	picker = {
		name = "telescope.nvim",
		mappings = {
			-- Create a new note from your query.
			new = "<C-x>",
			-- Insert a link to the selected note.
			insert_link = "<C-l>",
		}
	},

	note_frontmatter_func = function(note)
		-- Add the title of the note as an alias.
		if note.title then
			note:add_alias(note.title)
		end

		local out = { aliases = note.aliases, tags = note.tags }

		-- `note.metadata` contains any manually added fields in the frontmatter.
		-- So here we just make sure those fields are kept in the frontmatter.
		if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
			for k, v in pairs(note.metadata) do
				out[k] = v
			end
		end

		return out
	end,

	--  * "current_dir" - put new notes in same directory as the current buffer.
	--  * "notes_subdir" - put new notes in the default notes subdirectory.
	new_notes_location = "notes_subdir",

	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		-- In this case a note with the title 'My new note' will be given an ID that looks
		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		-- return tostring(os.time()) .. "-" .. suffix
		return suffix
	end,

	templates = {
		subdir = "2-Areas/Second-Brain/templates/nvim",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		tags = "",
		substitutions = {
			year = function()
				return os.date("%Y", os.time())
			end
		}
	},

	markdown_link_func = function(opts)
		local util = require "obsidian.util"
		local client = require("obsidian").get_client()
		local anchor = ""
		local header = ""

		if opts.anchor then
			anchor = opts.anchor.anchor
			header = util.format_anchor_label(opts.anchor)
		elseif opts.block then
			anchor = "#" .. opts.block.id
			header = "#" .. opts.block.id
		end

		-- This is now an absolute path to the file.
		local path = client.dir / opts.path
		-- This is an absolute path to the current buffer's parent directory.
		local buf_dir = client.buf_dir

		local rel_path
		if buf_dir:is_parent_of(path) then
			rel_path = tostring(path:relative_to(buf_dir))
		else
			local parents = buf_dir:parents()
			for i, parent in ipairs(parents) do
				if parent:is_parent_of(path) then
					rel_path = string.rep("../", i) .. tostring(path:relative_to(parent))
					break
				end
			end
		end

		local encoded_path = util.urlencode(rel_path, { keep_path_sep = true })
		return string.format("[%s%s](%s%s)", opts.label, header, encoded_path, anchor)
	end,

	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		if (vim.loop.os_uname().sysname == "Linux") then
			vim.fn.jobstart({"xdg-open", url}) -- Linux
		else
			vim.fn.jobstart({"open", url})  -- MacOS
		end
	end,

	-- Specify how to handle attachments.
	attachments = {
		-- The default folder to place images in via `:ObsidianPasteImg`.
		-- If this is a relative path it will be interpreted as relative to the vault root.
		-- You can always override this per image by passing a full path to the command instead of just a filename.
		img_folder = "4-Archives/zzz_attachments",
		-- A function that determines the text to insert in the note when pasting an image.
		-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
		-- This is the default implementation.
		---@param client obsidian.Client
		---@param path obsidian.Path the absolute path to the image file
		---@return string
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![%s](%s)", path.name, path)
		end,
	},

	ui = {
		-- Let render-markdown take over
		enable = false,
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" }
			-- [">"] = { char = "", hl_group = "ObsidianRightArrow" },
			-- ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			-- ["!"] = { char = "", hl_group = "ObsidianImportant" },
		}
	}
  }
}
