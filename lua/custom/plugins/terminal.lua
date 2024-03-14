return {
  {
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = function()
        require('toggleterm').setup {
          size = 50,
          open_mapping = [[<C-x>]],
          insert_mappings = true,
          terminal_mappings = true,
          direction = 'vertical',
        }
      end,
    },
  },
}
