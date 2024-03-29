vim.g.material_style = 'deep ocean'

local function set_highlight_cursor()
  vim.cmd [[highlight Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=Orange gui=bold]]
end
vim.defer_fn(set_highlight_cursor, 10)

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
