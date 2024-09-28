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
    { '<LocalLeader>cc', '<cmd>CodeCompanion<cr>', mode = { 'v', 'n' }, desc = '[C]ode Companion', noremap = true },
    { '<LocalLeader>ch', ':CodeCompanionChat', mode = { 'v', 'n' }, desc = 'C[h]at', noremap = true },
    { '<LocalLeader>cp', '<cmd>CodeCompanionActions<cr>', mode = { 'v', 'n' }, desc = 'Action [P]anel', noremap = true },
    { '<LocalLeader>cg', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'v', 'n' }, desc = 'To[g]gle Chat Window', noremap = true },
    { '<LocalLeader>ca', '<cmd>CodeCompanionChat Add<cr>', mode = { 'v', 'n' }, desc = '[A]dd Visual Selection', noremap = true },
  },
  opts = {
    -- TODO: change all that to anthropic
    strategies = {
      chat = {
        adapter = 'openai',
      },
      inline = {
        adapter = 'openai',
      },
      agent = {
        adapter = 'openai',
      },
    },
    adapters = {
      openai = function()
        return require('codecompanion.adapters').extend('openai', {
          env = {
            api_key = 'cmd:pass open_ai',
          },
          schema = {
            model = {
              default = 'gpt-4o-2024-08-06',
            },
          },
        })
      end,
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = 'cmd:pass claude',
          },
          schema = {
            model = {
              default = 'claude-3-5-sonnet-20240620',
            },
          },
        })
      end,
    },
  },
  config = function(_, opts)
    require('codecompanion').setup(opts)
    vim.cmd [[cab cc CodeCompanion]]
    vim.cmd [[cab ccc CodeCompanionChat]]
  end,
}
