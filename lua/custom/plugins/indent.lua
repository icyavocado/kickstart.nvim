return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.comment').setup()
      require('mini.indentscope').setup {
        draw = {
          animation = function()
            return 1
          end,
        },
        symbol = '│',
      }
      require('mini.statusline').setup {
        use_icons = true,
      }
      local animate = require 'mini.animate'
      animate.setup {
        scroll = {
          enable = false,
        },
        cursor = {
          timing = animate.gen_timing.cubic { duration = 50, unit = 'total' },
        },
      }
      require('mini.surround').setup()
      require('mini.tabline').setup()
      require('mini.visits').setup()
    end,
  },
}
