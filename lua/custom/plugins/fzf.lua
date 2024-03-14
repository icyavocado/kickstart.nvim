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
      require('fzf-lua').setup {}
      vim.keymap.set('n', '<C-p>', function()
        require('fzf-lua').files {
          cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
          winopts = { preview = { hidden = 'hidden' } },
        }
      end, { silent = true })
      vim.keymap.set('n', '<C-m>', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })
      vim.keymap.set('n', '<C-s-f>', "<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
      vim.keymap.set('n', '<C-f>', "<cmd>lua require('fzf-lua').grep_cWORD()<CR>", { silent = true })
      require('fzf-lua').resume()
    end,
  },
}
