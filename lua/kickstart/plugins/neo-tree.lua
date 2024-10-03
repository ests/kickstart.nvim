-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', '<cmd>Neotree toggle focus last left<CR>', desc = 'NeoTree toggle', silent = true },
    { '<localleader>n', '<cmd>Neotree focus reveal left<CR>', desc = 'NeoTree focus', silent = true },
  },
  opts = {
    source_selector = {
      winbar = true,
      statusline = false,
    },
    -- filesystem = {
    --   window = {
    --     mappings = {
    --       ['\\'] = 'close_window',
    --     },
    --   },
    -- },
  },
}
