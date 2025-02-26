return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      highlight_headers = false,
      separator = '---',
      error_header = '> [!ERROR] Error',
      -- model = 'gpt-4',
      model = 'claude-3.7-sonnet',
      window = {
        layout = 'float',
        relative = 'editor',
        border = 'rounded',
        width = 1,
        height = 0.46,
        row = 98,
      },
    },
    cmd = { 'CopilotChat' },
    keys = {
      { '<leader>aa', '<cmd>CopilotChatToggle<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent' },
      { '<leader>ae', '<cmd>CopilotChatExplain<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Explain' },
      { '<leader>af', '<cmd>CopilotChatFix<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Fix' },
      { '<leader>ar', '<cmd>CopilotChatReview<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Code' },
      { '<leader>ad', '<cmd>CopilotChatDocs<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Documentation' },
      { '<leader>ac', '<cmd>CopilotChatCommit<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Agent Commit' },
      {
        '<leader>aq',
        function()
          local input = vim.fn.input 'Quick Chat: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = 'Agent Quick chat',
      },
      {
        '<leader>ao',
        '<cmd>CopilotChatOptimize<cr>',
        mode = { 'n', 'v' },
        noremap = true,
        nowait = true,
        silent = true,
        desc = 'Optimize performance and readability',
      },
      { '<leader>at', '<cmd>CopilotChatTests<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Add tests' },
    },
  },
}
