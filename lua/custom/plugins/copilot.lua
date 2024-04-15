return {
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_filetypes = {
        perl = false,
      }
    end,
  },
}
