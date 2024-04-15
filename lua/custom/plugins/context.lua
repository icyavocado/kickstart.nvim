return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('nvim-treesitter.configs').setup {
        context = {
          enable = true,
          throttle = true,
        },
      }
    end,
  },
}
