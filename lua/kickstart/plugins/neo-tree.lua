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
    { '<leader>\\', '<cmd>Neotree toggle focus last float<CR>', desc = 'NeoTree toggle', silent = true },
    { '<C-n>', '<cmd>Neotree toggle focus last left<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>fo', '<cmd>Neotree focus<CR>', desc = 'NeoTree focus', silent = true },
  },
  opts = {
    close_if_last_window = true,
    source_selector = {
      winbar = true,
      statusline = false,
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
      },
      file_size = {
        enabled = false,
        width = 12, -- width of the column
        required_width = 64, -- min width of window required to show this column
      },
      type = {
        enabled = false,
        width = 10, -- width of the column
        required_width = 122, -- min width of window required to show this column
      },
      last_modified = {
        enabled = false,
        width = 20, --width of the column
        required_width = 88, -- min width of window required to show this column
      },
      created = {
        enabled = false,
        width = 20, -- width of the column
        required_width = 110, -- min width of window required to show this column
      },
      symlink_target = {
        enabled = false,
      },
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
