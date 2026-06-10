return {
  'nvim-treesitter/nvim-treesitter',
  event = "VeryLazy",
  build = ":TSUpdate",
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then return end
    configs.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "lua",
        "python",
      }
    })
  end
}
