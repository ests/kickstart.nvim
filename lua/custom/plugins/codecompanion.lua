-- https://github.com/olimorris/codecompanion.nvim
return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
    'nvim-telescope/telescope.nvim', -- Optional: For working with files with slash commands
    {
      'stevearc/dressing.nvim', -- Optional: Improves the default Neovim UI
      opts = {},
    },
  },
  event = 'VeryLazy',
  keys = {
    { '<LocalLeader>cc', '<cmd>CodeCompanion<cr>', mode = { 'v', 'n' }, desc = 'Inline companion', noremap = true, silent = true },
    { '<LocalLeader>cp', '<cmd>CodeCompanionActions<cr>', mode = { 'v', 'n' }, desc = 'Action Panel', noremap = true, silent = true },
    { '<LocalLeader>ct', '<cmd>CodeCompanionToggle<cr>', mode = { 'v', 'n' }, desc = 'Toggle Chat Window', noremap = true, silent = true },
    { '<LocalLeader>ca', '<cmd>CodeCompanionAdd<cr>', mode = { 'v', 'n' }, desc = 'Add', noremap = true, silent = true },
  },
  opts = {
    adapters = {
      openai = function()
        return require('codecompanion.adapters').extend('openai', {
          env = {
            api_key = 'cmd:pass open_ai',
          },
        })
      end,
    },
  },
  config = function(_, opts)
    require('codecompanion').setup(opts)
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
