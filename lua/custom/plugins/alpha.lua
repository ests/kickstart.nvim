return {
  -- Start page
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    local function footer()
      -- local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = version.major .. '.' .. version.minor .. '.' .. version.patch

      return nvim_version_info
    end

    dashboard.section.header.val = {
      '                                                          ',
      '                                                          ',
      '             █▒▒                     █▒▒▒ █▒▒▒▒▒▒          ',
      '             █▒▒                          █▒▒              ',
      '             █▒▒      █▒▒       █▒▒▒▒     █▒▒              ',
      '             █▒▒    █▒   █▒▒   █▒▒        █▒▒              ',
      '             █▒▒   █▒▒▒▒▒ █▒▒    █▒▒▒     █▒▒              ',
      '             █▒▒   █▒              █▒▒    █▒▒              ',
      '             █▒▒     █▒▒▒▒     █▒▒ █▒▒    █▒▒              ',
      '                                                          ',
      '                                                          ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('l', 'Last Session', ':SessionManager load_current_dir_session<CR>'),
      dashboard.button('n', 'New File', ':ene <BAR> startinsert <CR>'),
      dashboard.button('e', 'Find File', ':Telescope find_files<CR>'),
      dashboard.button('g', 'Live Grep', ':Telescope live_grep<CR>'),
      dashboard.button('r', 'Recent', ':Telescope oldfiles<CR>'),
      dashboard.button('s', 'Settings', ':e $MYVIMRC | :cd %:p:h<CR>'),
      dashboard.button('q', 'Quit', ':qa<CR>'),
    }

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = 'Constant'

    alpha.setup(dashboard.opts)
  end,
}
