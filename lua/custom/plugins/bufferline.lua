-- https://github.com/akinsho/bufferline.nvim
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        close_command = 'Bdelete %d', -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = 'Bdelete %d', -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = 'Bdelete! %d', -- can be a string | function, | false see "Mouse actions"
        hover = {
          enabled = true,
          delay = 20,
          hover = { 'close' },
        },
        separator_style = 'slant',
        diagnostics = 'nvmim_lsp',
        numbers = function(opts)
          return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        end,
        sort_by = 'inser_after_current',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
            s = s .. n .. sym
          end
          return s
        end,
      },
    }
  end,
}
