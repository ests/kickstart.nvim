return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = false,
  ft = { 'markdown', 'codecompanion' },
  -- cmd = { 'RenderMarkdown' }, -- Remove this if using ft
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = { blink = { enabled = true } },
    -- Add more configuration as needed
    render = {
      max_file_size = 1.5, -- MB
    },
  },
}
