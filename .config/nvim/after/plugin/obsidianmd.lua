require("obsidian").setup({
	-- Required, the path to your vault directory.
	-- dir = "~/Sec/Career/Learning/Notes/obsidian",
	workspaces = {
		{
			name = "Notes",
			path = 	"~/Sec/Career/Learning/Notes/obsidian"
		},
		{
			name = "armNotes",
			path = 	"~/Sec/Career/Drivers/ARM-STM32F103xx/MCAL/RCC/"
		},
		-- {
		-- 	name = "armNotes",
		-- 	path = 	"~/Sec/Career/Drivers/ARM-STM32F103xx/MCAL/RCC/"
		-- },
	},

	-- Optional, completion.
	completion = {
		-- If using nvim-cmp, otherwise set to false
		nvim_cmp = true,
		-- Trigger completion at 2 chars
		min_chars = 2,
		-- Where to put new notes created from completion. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "current_dir",

		-- Whether to add the output of the node_id_func to new notes in autocompletion.
		-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
		-- prepend_note_id = false
	},

	-- Optional, key mappings.
	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
	},

	-- Optional, if set to true, the specified mappings in the `mappings`
	-- table will overwrite existing ones. Otherwise a warning is printed
	-- and the mappings are not applied.
	-- overwrite_mappings = true,

	-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
	open_app_foreground = false,

	-- Optional, by default commands like `:ObsidianSearch` will attempt to use
	-- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
	-- first one they find. By setting this option to your preferred
	-- finder you can attempt it first. Note that if the specified finder
	-- is not installed, or if it the command does not support it, the
	-- remaining finders will be attempted in the original order.
	finder = "telescope.nvim",

	-- Optional, sort search results by "path", "modified", "accessed", or "created".
	-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example `:ObsidianQuickSwitch`
	-- will show the notes sorted by latest modified time
	sort_by = "modified",
	sort_reversed = true,

	-- Optional, determines whether to open notes in a horizontal split, a vertical split,
	-- or replacing the current buffer (default)
	-- Accepted values are "current", "hsplit" and "vsplit"
	open_notes_in = "current"
})
