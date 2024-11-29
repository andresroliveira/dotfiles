return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<C-Y>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
			silent = true,
		})
		vim.g.copilot_no_tab_map = true

		vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", {
			silent = true,
		})
	end,
}

