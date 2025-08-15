return {
  'olimorris/codecompanion.nvim',
  opts = {
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          show_result_in_chat = true, -- Show mcp tool results in chat
          make_vars = true, -- Convert resources to #variables
          make_slash_commands = true, -- Add prompts as /slash commands
        },
      },
    },
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
              choices = {
                'claude-opus-4-1-20250805', -- Latest and most capable
                'claude-sonnet-4-20250514', -- Current default - balanced
                'claude-3-5-haiku-20241022', -- Fastest and most cost-effective
              },
            },
            -- extended_thinking = {
            --   default = true,
            -- },
            -- thinking_budget = {
            --   default = 40000,
            -- },
            max_tokens = {
              default = 8000, -- Updated to Claude 3.5 Haiku max (8K tokens)
            },
            temperature = {
              default = 0.35,
            },
          },
          env = {
            api_key = 'cmd:envchain ests/personal/anthropic printenv ANTHROPIC_API_KEY',
          },
        })
      end,
      gemini = function()
        return require('codecompanion.adapters').extend('gemini', {
          env = {
            api_key = 'cmd:envchain ests/personal/anthropic printenv GEMINI_API_KEY',
          },
          schema = {
            model = {
              default = 'gemini-2.5-pro',
            },
          },
        })
      end,
      tavily = function()
        return require('codecompanion.adapters').extend('tavily', {
          env = {
            api_key = 'cmd:envchain ests/personal/anthropic printenv TAVILY_API_KEY',
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
          width = 0.40,
          height = 1,
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
