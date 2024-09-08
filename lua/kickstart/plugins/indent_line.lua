return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      debounce = 300,
      indent = {
        smart_indent_cap = true,
        priority = 2,
        highlight = { 'LineNr' },
        char = '│',
      },
      scope = { show_start = false, show_end = false },
    },
  },
}
