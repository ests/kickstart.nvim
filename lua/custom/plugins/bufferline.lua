-- https://github.com/akinsho/bufferline.nvim
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { '<tab>', '<cmd>BufferLineCycleNext<cr>' },
    { '<s-tab>', '<cmd>BufferLineCyclePrev<cr>' },
    { 'gC', '<cmd>BufferLinePickClose<cr>', desc = 'buffline: Close pick' },
    { 'go', '<cmd>BufferLinePick<cr>', desc = 'buffline: Pick' },
    {
      '<leader>1',
      function()
        require('bufferline').go_to(1, true)
      end,
    },
    {
      '<leader>2',
      function()
        require('bufferline').go_to(2, true)
      end,
    },
    {
      '<leader>3',
      function()
        require('bufferline').go_to(3, true)
      end,
    },
    {
      '<leader>4',
      function()
        require('bufferline').go_to(4, true)
      end,
    },
    {
      '<leader>5',
      function()
        require('bufferline').go_to(5, true)
      end,
    },
    {
      '<leader>6',
      function()
        require('bufferline').go_to(6, true)
      end,
    },
  },
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
        -- diagnostics = 'nvmim_lsp',
        -- numbers = function(opts)
        --   return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        -- end,
        sort_by = 'inser_after_current',
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   local s = ' '
        --   for e, n in pairs(diagnostics_dict) do
        --     local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
        --     s = s .. n .. sym
        --   end
        --   return s
        -- end,
      },
    }
  end,
}
