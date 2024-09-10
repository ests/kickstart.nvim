return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      debounce = 100,
      indent = {
        smart_indent_cap = true,
        priority = 2,
        highlight = { 'LineNr' },
        char = '│',
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          '*oil*',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
          'asm',
          'text',
          'neogitstatus',
        },
      },
    },
  },
}
