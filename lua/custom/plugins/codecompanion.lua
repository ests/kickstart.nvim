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
              default = 'claude-opus-4-1-20250805',
            },
            extended_thinking = {
              default = true,
            },
            thinking_budget = {
              default = 40000, -- 40k tokens for thorough code reasoning and explanations
            },
            max_tokens = {
              default = 8192, -- Increased for longer code generation and explanations
            },
            temperature = {
              default = 0.35, -- Low temperature for consistent, focused code generation
            },
            -- top_p = {
            --   default = 0.95, -- Slightly reduced for more focused outputs
            -- },
            -- top_k is not typically used with Claude, leaving it nil
            -- stop_sequences can be left nil unless you have specific needs
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
