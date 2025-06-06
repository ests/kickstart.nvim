-- https://github.com/akinsho/bufferline.nvim
return {
  'akinsho/bufferline.nvim',
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
  opts = {
    options = {
      close_command = 'Bdelete %d', -- can be a string | function, | false see "Mouse actions"
      right_mouse_command = 'Bdelete %d', -- can be a string | function | false, see "Mouse actions"
      left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
      middle_mouse_command = 'Bdelete! %d', -- can be a string | function, | false see "Mouse actions"
      diagnostics = 'nvim_lsp',
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
      separator_style = 'thick',
      numbers = function(opts)
        return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
      end,
      sort_by = 'insert_after_current',
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = ' '
        for e, n in pairs(diagnostics_dict) do
          local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
          s = s .. n .. sym
        end
        return s
      end,
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)
    -- Fix bufferline when restoring a session
    local group = vim.api.nvim_create_augroup('CustomBufferlineRefresh', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
      group = group,
      callback = function()
        vim.schedule(function()
          -- Temporary log message
          print('Refreshing bufferline due to BufAdd/BufDelete')
          pcall(require('bufferline').setup, opts)
        end)
      end,
    })
  end,
}
