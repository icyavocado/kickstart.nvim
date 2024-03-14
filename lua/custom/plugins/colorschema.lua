vim.g.material_style = 'deep ocean'

return {
  { 'marko-cerovac/material.nvim' },
  -- Configure LazyVim to load gruvbox
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'material',
    },
  },
}
