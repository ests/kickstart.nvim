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
      model = 'gpt-4',
      -- model = 'claude-3.5-sonnet',
      window = {
        -- width = 0.45,
      },
    },
    cmd = { 'CopilotChat' },
    keys = {
      { '<leader>aa', '<cmd>CopilotChatToggle<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Toggle Copilot Chat' },
      { '<leader>ae', '<cmd>CopilotChatExplain<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Explain code' },
      { '<leader>af', '<cmd>CopilotChatFix<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Fix code' },
      { '<leader>ar', '<cmd>CopilotChatReview<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Review code' },
      { '<leader>ad', '<cmd>CopilotChatDocs<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Generate documentation' },
      { '<leader>ac', '<cmd>CopilotChatCommit<cr>', mode = { 'n', 'v' }, noremap = true, silent = true, desc = 'Generate commit message' },
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
