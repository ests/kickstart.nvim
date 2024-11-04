return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        ignore_focus = { 'neo-tree', 'alpha' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          {
            'branch',
            icon = '',
            color = { gui = 'bold' },
          },
          'diff',
          'diagnostics',
        },
        lualine_c = {
          {
            'filename',
            path = 4,
            symbols = { modified = '', readonly = '', unnamed = '[no name]', newfile = '' },
          },
        },

        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
