return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'kanagawa',
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
            path = 1,
            symbols = { modified = '', readonly = '[ro]', unnamed = '[no name]', newfile = '' },
            shorting_target = 10,
          },
        },

        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = { modified = '', readonly = '[ro]', unnamed = '[no name]', newfile = '' },
            shorting_target = 10,
          },
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
