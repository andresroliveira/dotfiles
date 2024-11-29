return {
    {
        "folke/tokyonight.nvim",
        priority = 10000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
				style = "night",
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				transparent = true,
			})
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
}

