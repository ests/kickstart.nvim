return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.catppuccin_flavour = 'mocha' -- latte, frappe, macchiato, mocha

    local colors = require('catppuccin.palettes').get_palette()
    require('catppuccin').setup {
      transparent_background = true,
      term_colors = true,
      compile = {
        enabled = true,
        path = vim.fn.stdpath 'cache' .. '/catppuccin',
      },
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      styles = {
        comments = { 'italic' },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        navic = { enabled = true, custom_bg = 'lualine' },
        aerial = true,
        alpha = true,
        dashboard = true,
        flash = true,
        headlines = true,
        illuminate = true,
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        treesitter_context = true,
        which_key = true,
        gitgutter = true,
        markdown = true,
        treesitter = true,
        vim_sneak = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
        },
      },
      color_overrides = {
        all = {
          rosewater = '#ECE1DE',
          flamingo = '#B7919B', -- ruby symbols
          pink = '#CEBCE1',
          mauve = '#B98DEC',

          red = '#E17070',
          maroon = '#A4C0D9',

          peach = '#EF9356', -- numbers
          yellow = '#CC9D50',
          green = '#88C06C',
          teal = '#84D1A8',
          sky = '#88CBE6',
          sapphire = '#DB8559',
          blue = '#7FA3E5',
          -- lavender  = "#928BD1",
          --
          text = '#B6BDC8',
          subtext1 = '#A3ACBA',
          subtext0 = '#98A2B2',
          --
          overlay2 = '#939AB7',
          overlay1 = '#8087A2',
          overlay0 = '#6E738D',
          --
          surface2 = '#6B7788', -- comments
          surface1 = '#4A525C', -- line numbers
          surface0 = '#323A46',

          base = '#1C2021',
          mantle = '#151616',
          crust = '#05070A',
        },
      },
      highlight_overrides = {
        all = {
          CursorColumn = { bg = colors.crust }, -- Screen-column at the cursor, when 'cursorcolumn' is secp.
          LineNr = { fg = '#565F6D' },
          -- Visual = { bg = colors.pink, fg = colors.mantle },
          VertSplit = { fg = colors.surface1 },
          Search = { bg = colors.flamingo, fg = colors.mantle, style = { 'bold' } },
        },
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
