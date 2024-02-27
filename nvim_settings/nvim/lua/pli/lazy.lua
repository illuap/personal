local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ 'nvim-treesitter/nvim-treesitter', 
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
					disable = {},
				},
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"markdown",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"c_sharp",
				},        
				incremental_selection = {
				  enable = true,
				  keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				  },
				},
			})
		end
	},
	{ 'tpope/vim-surround' },
	{ 'easymotion/vim-easymotion' },
	{ 'tpope/vim-commentary'},
	{ 'williamboman/mason.nvim' },
	{ 'stevearc/dressing.nvim', event = 'VeryLazy' },
    { 'rose-pine/neovim', as = 'rose-pine', config = function()
        vim.cmd('colorscheme rose-pine')
      end
    },
}

local opts = {}

require("lazy").setup({ plugins, { import = "pli.plugins" }, { import = "pli.plugins.lsp"} }, opts)
