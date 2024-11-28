-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    -- local cond = require 'nvim-autopairs.conds'
    require('nvim-autopairs').setup {
      check_ts = true,
      ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
        java = false, -- don't check treesitter on java
      },
    }
    -- fix ```
    npairs.add_rules {
      Rule('```', '```', { 'markdown', 'vimwiki', 'rmarkdown', 'pandoc', 'codecompanion' }),
      Rule('```.*$', '```', { 'markdown', 'vimwiki', 'rmarkdown', 'pandoc', 'codecompanion' }),
    }

    -- (deprecated?) endwise rules
    npairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')
    npairs.add_rules(require 'nvim-autopairs.rules.endwise-ruby')

    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
