local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 0,
	},

	{ "blazkowolf/gruber-darker.nvim"
	},

	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({ mirage = true })
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				variant = "default",
				transparent = false,
				saturation = 1,
				italic_comments = false,
				hide_fillchars = false,
				borderless_pickers = false,
				terminal_colors = true,
				cache = false,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			theme = "auto",
		},
	},
}
:
