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
  keys = {
    { '<C-a>', '<cmd>CodeCompanionActions<cr>', mode = { 'v', 'n' }, desc = 'CC: Actions', noremap = true, silent = true },
    { '<LocalLeader>a', '<cmd>CodeCompanionToggle<cr>', mode = { 'v', 'n' }, desc = 'CC: Toggle', noremap = true, silent = true },
    { 'ga', '<cmd>CodeCompanionAdd<cr>', mode = { 'v', 'n' }, desc = 'CC: Add', noremap = true, silent = true },
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
