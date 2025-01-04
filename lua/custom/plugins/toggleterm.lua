return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = {
      'ToggleTerm',
      'TermExec',
      'TermSelect',
      'ToggleTermSendVisualSelection',
      'ToggleTermSendVisualLines',
      'ToggleTermSendCurrentLine',
    },
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = '[T]oggle [T]erm' },
    },
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 20
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
      vim.cmd [[cab tt ToggleTerm]]
      vim.cmd [[cab tts ToggleTermSendVisualSelection]]
    end,
  },
}
