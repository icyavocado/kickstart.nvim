return {
  {
    'junegunn/fzf',
    dir = '~/.fzf',
    build = './install --all',
    name = 'fzf',
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {
        'borderless_full',
        winopts = {
          height = 0.3,
          width = 0.3,
          preview = {
            hidden = 'hidden',
          },
        },
        fzf_opts = {
          ['--layout'] = 'default',
          ['--border'] = 'none',
          ['--info'] = 'default',
        },
        defaults = {
          git_icons = false,
          file_icons = false,
        },
      }

      vim.cmd "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --ignore-file ~/.searchignore --sort modified --sort accessed --no-messages'"

      vim.keymap.set('n', '<C-p>', function()
        require('fzf-lua').files {
          cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
          previewer = false,
          actions = {
            toggle_ignore = false,
          },
        }
      end, { silent = true, noremap = true })

      vim.keymap.set('n', '<C-\\>', function()
        require('fzf-lua').buffers()
      end, { silent = true })

      -- vim.keymap.set('n', '<C-k>', function()
      --   require('fzf-lua').builtin()
      -- end, { silent = true })
      --
      -- vim.keymap.set('n', '<C-l>', function()
      --   require('fzf-lua').live_grep {
      --     cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
      --   }
      -- end, { silent = true })

      vim.keymap.set('n', '<C-r>', function()
        require('fzf-lua').oldfiles()
      end, { silent = true })

      vim.keymap.set('n', '<C-g>', function()
        require('fzf-lua').live_grep {
          cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
        }
      end, { silent = true })
    end,
  },
}
