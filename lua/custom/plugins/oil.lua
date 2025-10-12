return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory', mode = 'n' },
  },
}
