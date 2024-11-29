return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { 
                "c",
                "regex",
                "bash",
                "markdown",
                "markdown_inline",
                "lua", 
                "vim", 
                "vimdoc", 
                "query", 
                "elixir",
                "heex", 
                "javascript",
                "html",
                "css",
                "json",
                "python",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

