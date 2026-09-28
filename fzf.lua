return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, you may already have this
	keys = {
		{ "<leader>ff", function() require("fzf-lua").files() end,     desc = "Find files" },
		{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
		{ "<leader>fb", function() require("fzf-lua").buffers() end,   desc = "Buffers" },
		{ "<leader>fo", function() require("fzf-lua").oldfiles() end,  desc = "Recent files" },
	},
	opts = {},
}
