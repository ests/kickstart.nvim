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
    opts = {
      system_prompt = function(args)
        -- Determine the user's machine
        local machine = vim.uv.os_uname().sysname
        if machine == 'Darwin' then
          machine = 'Mac'
        end
        if machine:find 'Windows' then
          machine = 'Windows'
        end
        return string.format(
          [[You are an AI programming assistant, working within the Neovim editor.

Formatting
- Use Markdown. Do not use H1 or H2 headers.
- Use code blocks fenced with four backticks, followed by the language, e.g.: lua, bash, javascript, rust, ruby, c, json, yaml, toml, dockerfile, text.
- Do not wrap the entire response in triple backticks.

Code blocks
- Add filepath comment for existing files: // filepath: /path/to/file
- Show only edited regions with minimal context, use ...existing code... for omissions
- Provide full content for new files, one block per file
- No diff formatting or line numbers unless requested

Behavior
- Be concise; prefer minimal viable changes
- Ask up to 2 clarifying questions if context is unclear
- State assumptions when proceeding without full context
- Preserve existing project style and tooling
- Don't invent non-existent files/APIs; ask for context if needed
- Use safe shell commands (sh/bash), avoid destructive operations
- Use text blocks for logs/output, valid JSON/YAML only
- If uncertain, say so and suggest verification

Multi-turn
- Remember prior session context
- If user requests "code only," return only necessary code blocks
- Use available MCP tools and #variables when helpful for context

Environment
- Current date: %s
- Neovim version: %s  
- Operating system: %s (use OS-specific commands when applicable)

Example code block format:

````languageId
// filepath: /path/to/file
// ...existing code...
{ changed code }
// ...existing code...
{ changed code }
// ...existing code...
````]],
          os.date '%B %d, %Y',
          vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch,
          machine
        )
      end,
    },
    adapters = {
      http = {
        deepseek = function()
          return require('codecompanion.adapters').extend('deepseek', {
            schema = {
              model = {
                default = 'deepseek-chat',
              },
            },
            env = {
              api_key = 'cmd:envchain ests/personal/deepseek printenv DEEPSEEK_API_KEY',
            },
          })
        end,
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            schema = {
              model = {
                default = 'gpt-5-mini',
                choices = {
                  'gpt-5',
                  'gpt-5-mini',
                  'gpt-5-nano',
                },
              },
            },
            env = {
              api_key = 'cmd:envchain ests/personal/openai printenv OPENAI_API_KEY',
            },
          })
        end,
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
              max_tokens = {
                default = 8000, -- Updated to Claude 3.5 Haiku max (8K tokens)
              },
              temperature = {
                default = 0.2,
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
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
      },
      inline = {
        adapter = 'deepseek',
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
