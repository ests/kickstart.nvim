return {
  'robitx/gp.nvim',
  event = 'VeryLazy',
  keys = {
    -- n
    { '<localleader>cv', '<cmd>GpChatNew vsplit<cr>', mode = { 'n' }, desc = 'New chat vsplit', noremap = true, nowait = true },
    { '<localleader>co', '<cmd>GpChatNew popup<cr>', mode = { 'n' }, desc = 'New chat popup', noremap = true, nowait = true },
    { '<localleader>cs', '<cmd>GpChatNew split<cr>', mode = { 'n' }, desc = 'New chat split', noremap = true, nowait = true },
    { '<localleader>ca', '<cmd>GpAppend<cr>', mode = { 'n' }, desc = 'Append after', noremap = true, nowait = true },
    { '<localleader>cb', '<cmd>GpPrepend<cr>', mode = { 'n' }, desc = 'Prepend before', noremap = true, nowait = true },
    { '<localleader>cr', '<cmd>GpRewrite<cr>', mode = { 'n' }, desc = 'Rewrite', noremap = true, nowait = true },
    { '<localleader>cn', '<cmd>GpNextAgent<cr>', mode = { 'n' }, desc = 'Next Agent', noremap = true, nowait = true },
    { '<localleader>cs', '<cmd>GpStop<cr>', mode = { 'n' }, desc = 'Stop!', noremap = true, nowait = true },
    { '<localleader>cm', '<cmd>GpGitCommit<cr>', mode = { 'n' }, desc = 'Git Commit', noremap = true, nowait = true },
    { '<localleader>ct', '<cmd>GpChatToggle<cr>', mode = { 'n' }, desc = 'ChatToggle', noremap = true, nowait = true },
    -- v
    { '<localleader>cv', ":<C-u>'<,'>GpChatNew vsplit<cr>", mode = { 'v' }, desc = 'New chat vsplit', noremap = true, nowait = true },
    { '<localleader>co', ":<C-u>'<,'>GpChatNew popup<cr>", mode = { 'n' }, desc = 'New chat popup', noremap = true, nowait = true },
    { '<localleader>cs', ":<C-u>'<,'>GpChatNew split<cr>", mode = { 'n' }, desc = 'New chat split', noremap = true, nowait = true },
    { '<localleader>ca', ":<C-u>'<,'>GpAppend<cr>", mode = { 'v' }, desc = 'Append after', noremap = true, nowait = true },
    { '<localleader>cb', ":<C-u>'<,'>GpPrepend<cr>", mode = { 'v' }, desc = 'Prepend before', noremap = true, nowait = true },
    { '<localleader>cr', ":<C-u>'<,'>GpRewrite<cr>", mode = { 'v' }, desc = 'Rewrite', noremap = true, nowait = true },
    { '<localleader>cn', '<cmd>GpNextAgent<cr>', mode = { 'v' }, desc = 'Next Agent', noremap = true, nowait = true },
    { '<localleader>cs', '<cmd>GpStop<cr>', mode = { 'v' }, desc = 'Stop!', noremap = true, nowait = true },
    { '<localleader>ct', ":<C-u>'<,'>GpChatToggle<cr>", mode = { 'v' }, desc = 'ChatToggle', noremap = true, nowait = true },
    { '<localleader>cp', ":<C-u>'<,'>GpChatPaste<cr>", mode = { 'v' }, desc = 'Visual Chat paste', noremap = true, nowait = true },
    { '<localleader>ci', ":<C-u>'<,'>GpImplement<cr>", mode = { 'v' }, desc = 'Implement Selection', noremap = true, nowait = true },
  },
  config = function()
    local default_chat_system_prompt = [[
      You are an expert senior developer. Provide accurate, concise, and high-quality
      coding assistance a computer science knowledge.

      Focus on:
      1. Clean, efficient, bug-free code
      2. Minimal code comments (only for complex logic)
      3. Best practices and optimizations
      4. Error handling where critical

      Consider:
      - Performance and scalability
      - Security implications
      - Resource management
      - Edge cases

      When multiple solutions exist, provide only the most practical approach unless
      specific constraints are mentioned.

      If possible, kepp your responses moderately brief.
      Always maintain technical accuracy.

      Some common tasks will include writing new code, or validating existing code. In that case:
      1. If the user is requesting new features:
         - Determine if the requested features are feasible given the existing code structure.
         - Suggest implementations for the new features, providing code snippets where appropriate.
         - Explain any potential impacts on the existing codebase.

      2. If the user is asking to check for existing problems or errors:
         - Identify any actual or potential issues in the code, such as bugs, inefficiencies, or style problems.
         - Explain the problems you've found and why they are problematic.
         - Suggest solutions or improvements, providing code snippets where appropriate.
    ]]

    local default_code_system_prompt = 'You are an AI working as a code editor.\n\n'
      .. 'As code editor you do not generate any COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n'
      .. 'START AND END YOUR ANSWER ONLY WITH:\n\n```'

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
          name = 'ChatClaude-3-5-Sonnet',
          chat = true,
          command = false,
          model = { model = 'claude-3-5-sonnet-20241022', temperature = 1, top_p = 1 },
          system_prompt = default_chat_system_prompt,
        },
        {
          provider = 'anthropic',
          name = 'CodeClaude-3-5-Sonnet',
          chat = false,
          command = true,
          model = { model = 'claude-3-5-sonnet-20241022', temperature = 0.8, top_p = 1 },
          system_prompt = default_code_system_prompt,
        },
      },
      default_command_agent = 'ChatClaude-3-5-Sonnet',
      default_chat_agent = 'ChatClaude-3-5-Sonnet',
      chat_user_prefix = '💬:',
      chat_assistant_prefix = { '🤖:', '[{{agent}}]' },
      chat_topic_gen_prompt = 'Summarize the topic of our conversation above' .. ' in two or three words. Respond only with those words.',
      command_prompt_prefix_template = '🤖 {{agent}} ~ ',
      log_file = nil,
      hooks = {
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
            .. 'Please rewrite this according to the contained instructions.\n'
            .. 'Detect programming language if not specified. Focus primarly on instructions in TODO comments.'
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

        -- example of adding command which writes unit tests for the selected code
        UnitTests = function(gp, params)
          local template = 'I have the following code from {{filename}}:\n\n'
            .. '```{{filetype}}\n{{selection}}\n```\n\n'
            .. 'Please respond by writing unit tests for the code above.'
          local agent = gp.get_command_agent()
          gp.Prompt(params, gp.Target.enew, agent, template)
        end,

        -- example of adding command which explains the selected code
        Explain = function(gp, params)
          local template = 'I have the following code from {{filename}}:\n\n'
            .. '```{{filetype}}\n{{selection}}\n```\n\n'
            .. 'Please respond by explaining the code above.'
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.popup, agent, template)
        end,
      },
    }

    require('gp').setup(config)
  end,
}
