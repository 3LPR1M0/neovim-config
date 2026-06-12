
return {
    {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      mode = "term",
      focus = true,
      filetype = {
        python = "python3 -u",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
    })

    vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
  end,
  }
}
