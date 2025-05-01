return {
  'olimorris/codecompanion.nvim',
  opts = {
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'claude-3.7-sonnet',
            },
          },
        })
      end,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = {
    'CodeCompanion',
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
