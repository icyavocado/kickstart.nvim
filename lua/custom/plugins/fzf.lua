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
      vim.g.fzf_layout = { window = { 'enew' }, down = '~30%' }
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {}
      vim.keymap.set('n', '<C-p>', function()
        vim.cmd "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --ignore-file ~/.searchignore --sort modified --sort accessed'"
        require('fzf-lua').files {
          cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
          winopts = {
            preview = {
              layout = 'vertical',
            },
          },
          sort_lastused = true,
        }
      end, { silent = true })
      vim.keymap.set('n', '<C-m>', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })

      vim.keymap.set('n', '<C-f>', function()
        require('fzf-lua').live_grep {
          cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
          winopts = {
            preview = {
              layout = 'vertical',
            },
          },
        }
      end, { silent = true })

      require('fzf-lua').resume()
    end,
  },
}
--
-- vim.cmd "let g:fzf_layout={'window': 'enew'}"
-- return {
--   {
--     'junegunn/fzf.vim',
--     dependencies = { 'junegunn/fzf' },
--     dir = '~/.fzf',
--     build = './install --all',
--     name = 'fzf',
--     config = function()
--       vim.keymap.set('n', '<C-p>', function()
--         vim.cmd "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --ignore-file ~/.searchignore --sortr modified --sortr accessed'"
--         vim.cmd 'FZF'
--       end, { silent = true })
--
--       vim.keymap.set('n', '<C-f>', function()
--         vim.cmd "let $FZF_DEFAULT_COMMAND = 'rg --word-regexp --hidden --ignore-file ~/.searchignore --sortr modified --sortr accessed'"
--         vim.cmd 'FZF'
--       end, { silent = true })
--     end,
--   },
-- }
