return {
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'VeryLazy',
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
    {
      '<leader>7',
      function()
        require('bufferline').go_to(7, true)
      end,
    },
  },
  config = function()
    local bufferline = require 'bufferline'

    bufferline.setup {
      options = {
        mode = 'buffers',
        style_preset = bufferline.style_preset.default,
        themable = true,
        numbers = function(opts)
          return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        end,
        close_command = 'Bdelete %d',
        right_mouse_command = 'Bdelete %d',
        left_mouse_command = 'buffer %d',
        middle_mouse_command = 'Bdelete! %d',
        indicator = {
          icon = '▎',
          style = 'underline',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        -- diagnostics_update_in_insert = false,
        -- diagnostics_update_on_event = true,
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --   local icon = level:match 'error' and ' ' or ' '
        --   return ' ' .. icon .. count
        -- end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        separator_style = 'slant',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        sort_by = 'insert_after_current',
      },
    }
  end,
}
-- https://github.com/akinsho/bufferline.nvim
