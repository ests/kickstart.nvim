return {
  'smoka7/hop.nvim',
  version = '*',
  keys = {
    {
      'f',
      function()
        require('hop').hint_char1 { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = false }
      end,
      mode = '',
      remap = true,
    },
    {
      'F',
      function()
        require('hop').hint_char1 { direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = false }
      end,
      mode = '',
      remap = true,
    },
    {
      't',
      function()
        require('hop').hint_char1 { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = false, hint_offset = -1 }
      end,
      mode = '',
      remap = true,
    },
    {
      'T',
      function()
        require('hop').hint_char1 { direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = false, hint_offset = -1 }
      end,
      mode = '',
      remap = true,
    },
  },
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
}
