return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = {
    'CdeCompanion',
    'CodeCompanionChat',
    'CodeCompanionAdd',
    'CodeCompanionCmd',
    'CodeCompanionActions',
  },
  keys = {
    { '<leader>aa', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent' },
    { '<leader>ad', '<cmd>CodeCompanionChat Add<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent A[d]d' },
    { '<leader>ap', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent [P]anel' },
  },
}
