local function enable_transparency()
	local groups = { "Normal", "NormalNC", "SignColumn", "EndOfBuffer" }
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = enable_transparency,
})

enable_transparency()

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
		priority = 0,
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
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({ variant = "moon" })
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
