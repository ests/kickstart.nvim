return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
        layout = {
          position = 'bottom', -- | top | left | right | horizontal | vertical
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 100,
        keymap = {
          accept = false,
          accept_word = '<M-Right>',
          accept_line = '<M-Down>',
          prev = '<M-[>',
          next = '<M-]>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    }

    local suggestion = require 'copilot.suggestion'

    vim.keymap.set('i', '<C-n>', function()
      if suggestion.is_visible() then
        suggestion.accept()
      else
        suggestion.next()
      end
    end, { desc = '[copilot] accept or next suggestion' })
  end,
}
