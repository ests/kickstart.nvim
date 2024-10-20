return {
  'robitx/gp.nvim',
  cmd = { 'GpGitCommit' },
  config = function()
    local default_chat_system_prompt = [[
      I want you to act as an expert and senior developer in the commong programming languages and CS.
      I will ask you questions, perhaps giving you code examples, and I want you to advise me with explanations and code where neccessary.
    ]]

    local default_code_system_prompt = 'You are an AI working as a code editor.\n\n'
      .. 'Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n'
      .. 'START AND END YOUR ANSWER WITH:\n\n```'

    local config = {
      providers = {
        openai = {
          disable = false,
          endpoint = 'https://api.openai.com/v1/chat/completions',
          secret = { 'pass', 'open_ai' },
        },
        anthropic = {
          disable = false,
          endpoint = 'https://api.anthropic.com/v1/messages',
          secret = { 'pass', 'claude' },
        },
      },
      agents = {
        {
          name = 'ChatGPT3-5',
          disable = true,
        },
        {
          provider = 'openai',
          name = 'ChatGPT4o',
          chat = true,
          command = false,
          model = { model = 'gpt-4o', temperature = 1.1, top_p = 1 },
          system_prompt = default_chat_system_prompt,
        },
        {
          provider = 'openai',
          name = 'ChatGPT4mini',
          chat = true,
          command = false,
          model = { model = 'gpt-4o-mini', temperature = 1.1, top_p = 1 },
          system_prompt = default_chat_system_prompt,
        },
        {
          provider = 'openai',
          name = 'CodeGPT4o',
          chat = false,
          command = true,
          model = { model = 'gpt-4o', temperature = 0.8, top_p = 1 },
          system_prompt = default_code_system_prompt,
        },
        {
          provider = 'openai',
          name = 'CodeGPT4mini',
          chat = false,
          command = true,
          model = { model = 'gpt-4o-mini', temperature = 0.8, top_p = 1 },
          system_prompt = default_code_system_prompt,
        },
        {
          provider = 'anthropic',
          name = 'CodeClaude-3-Haiku',
          disable = true,
        },
        {
          provider = 'anthropic',
          name = 'ChatClaude-3-5-Sonnet',
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = 'claude-3-5-sonnet-20240620', temperature = 0.8, top_p = 1 },
          system_prompt = default_chat_system_prompt,
        },
        {
          provider = 'anthropic',
          name = 'CodeClaude-3-5-Sonnet',
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = 'claude-3-5-sonnet-20240620', temperature = 0.8, top_p = 1 },
          system_prompt = default_code_system_prompt,
        },
      },
      default_command_agent = 'CodeGPT4o',
      default_chat_agent = 'ChatGPT4o',
      chat_user_prefix = '💬:',
      chat_assistant_prefix = { '🤖:', '[{{agent}}]' },
      chat_topic_gen_prompt = 'Summarize the topic of our conversation above' .. ' in two or three words. Respond only with those words.',
      command_prompt_prefix_template = '🤖 {{agent}} ~ ',
      log_file = nil,
      -- example hook functions (see Extend functionality section in the README)
      hooks = {
        -- GpInspectPlugin provides a detailed inspection of the plugin state
        -- InspectPlugin = function(plugin, params)
        --   local bufnr = vim.api.nvim_create_buf(false, true)
        --   local copy = vim.deepcopy(plugin)
        --   local key = copy.config.openai_api_key or ''
        --   copy.config.openai_api_key = key:sub(1, 3) .. string.rep('*', #key - 6) .. key:sub(-3)
        --   local plugin_info = string.format('Plugin structure:\n%s', vim.inspect(copy))
        --   local params_info = string.format('Command params:\n%s', vim.inspect(params))
        --   local lines = vim.split(plugin_info .. '\n' .. params_info, '\n')
        --   vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
        --   vim.api.nvim_win_set_buf(0, bufnr)
        -- end,

        GitCommit = function(gp, params)
          local diff = vim.fn.system 'git -c core.pager=cat diff --no-color --ignore-submodules --no-ext-diff --staged'
          local template = vim.fn.printf(
            [[You are an expert at following the Conventional Commit specification.
            OUTPUT ONLY GIT COMMIT!
            Given the git diff listed below, please generate a commit message for me:
            ```diff
            %s
            ```]],
            diff
          )
          local agent = gp.get_command_agent()
          gp.Prompt(params, gp.Target.prepend, agent, template)
        end,

        -- GpImplement rewrites the provided selection/range based on comments in it
        Implement = function(gp, params)
          local template = 'Having following from {{filename}}:\n\n'
            .. '```{{filetype}}\n{{selection}}\n```\n\n'
            .. 'Please rewrite this according to the contained instructions.'
            .. '\n\nRespond exclusively with the snippet that should replace the selection above.'

          local agent = gp.get_command_agent()

          gp.Prompt(
            params,
            gp.Target.rewrite,
            agent,
            template,
            nil, -- command will run directly without any prompting for user input
            nil -- no predefined instructions (e.g. speech-to-text from Whisper)
          )
        end,

        -- your own functions can go here, see README for more examples like
        -- :GpExplain, :GpUnitTests.., :GpTranslator etc.

        -- -- example of making :%GpChatNew a dedicated command which
        -- -- opens new chat with the entire current buffer as a context
        -- BufferChatNew = function(gp, _)
        -- 	-- call GpChatNew command in range mode on whole buffer
        -- 	vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
        -- end,

        -- -- example of adding command which opens new chat dedicated for translation
        -- Translator = function(gp, params)
        -- 	local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
        -- 	gp.cmd.ChatNew(params, chat_system_prompt)
        --
        -- 	-- -- you can also create a chat with a specific fixed agent like this:
        -- 	-- local agent = gp.get_chat_agent("ChatGPT4o")
        -- 	-- gp.cmd.ChatNew(params, chat_system_prompt, agent)
        -- end,

        -- -- example of adding command which writes unit tests for the selected code
        -- UnitTests = function(gp, params)
        -- 	local template = "I have the following code from {{filename}}:\n\n"
        -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
        -- 		.. "Please respond by writing table driven unit tests for the code above."
        -- 	local agent = gp.get_command_agent()
        -- 	gp.Prompt(params, gp.Target.enew, agent, template)
        -- end,

        -- -- example of adding command which explains the selected code
        -- Explain = function(gp, params)
        -- 	local template = "I have the following code from {{filename}}:\n\n"
        -- 		.. "```{{filetype}}\n{{selection}}\n```\n\n"
        -- 		.. "Please respond by explaining the code above."
        -- 	local agent = gp.get_chat_agent()
        -- 	gp.Prompt(params, gp.Target.popup, agent, template)
        -- end,
      },
    }

    require('gp').setup(config)
  end,
}
