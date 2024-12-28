return {
  'cbochs/portal.nvim',
  dependencies = {
    'cbochs/grapple.nvim',
  },
  keys = {
    { '<leader>o', '<cmd>Portal jumplist forward<cr>', mode = 'n', noremap = true, silent = true, desc = 'Jump forward in jumplist' },
    { '<leader>i', '<cmd>Portal jumplist backward<cr>', mode = 'n', noremap = true, silent = true, desc = 'Jump backward in jumplist' },
  },
}
