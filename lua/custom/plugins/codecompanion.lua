return {
  'olimorris/codecompanion.nvim',
  opts = {
    log_level = 'ERROR',
    send_code = true,
    use_default_actions = true,
    use_default_prompt_library = true,
    adapters = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          schema = {
            model = {
              default = 'claude-sonnet-4-20250514',
            },
          },
          env = {
            api_key = 'cmd:envchain ests/personal/anthropic printenv ANTHROPIC_API_KEY',
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
      },
      inline = {
        adapter = 'anthropic',
      },
      agent = {
        adapter = 'anthropic',
      },
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
      },
      chat = {
        window = {
          layout = 'vertical', -- vertical|horizontal|buffer
          width = 0.45,
          height = 0.8,
          relative = 'editor',
          opts = {
            breakindent = true,
            cursorcolumn = false,
            cursorline = false,
            foldcolumn = '0',
          },
        },
        intro_message = 'Welcome to CodeCompanion! How can I help you today?',
        separator = '---',
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- For enhanced file/buffer selection
  },
  cmd = {
    'CodeCompanion',
    'CodeCompanionChat',
    'CodeCompanionAdd',
    'CodeCompanionCmd',
    'CodeCompanionActions',
  },
  keys = {
    -- Core chat functionality
    { '<leader>aa', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Chat Toggle' },
    { '<leader>ad', '<cmd>CodeCompanionChat Add<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Chat Add' },
    { '<leader>ap', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Actions Panel' },

    -- Quick actions for common workflows
    { '<leader>ai', '<cmd>CodeCompanion<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Inline' },
    { '<leader>aq', '<cmd>CodeCompanionCmd<cr>', mode = 'n', noremap = true, silent = true, desc = 'Agent Quick Command' },

    {
      '<leader>as',
      function()
        vim.ui.input({ prompt = 'Ask CodeCompanion: ' }, function(input)
          if input and input ~= '' then
            vim.cmd('CodeCompanionChat ' .. input)
          end
        end)
      end,
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Agent Search/Ask',
    },
  },
}
