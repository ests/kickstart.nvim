return {
  'yetone/avante.nvim',
  build = function()
    if vim.fn.has 'win32' == 1 then
      return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
    else
      return 'make'
    end
  end,
  event = 'VeryLazy',
  version = false,
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = 'deepseek',
    providers = {
      deepseek = {
        __inherited_from = 'openai',
        endpoint = 'https://api.deepseek.com',
        model = 'deepseek-coder',
        api_key_name = 'cmd:envchain ests/personal/deepseek printenv DEEPSEEK_API_KEY',
        -- timeout = 30000,
        -- extra_request_body = {
        --   temperature = 0.75,
        --   max_tokens = 40000,
        -- },
      },
    },
    hints = { enabled = true }, -- ??
    mappings = {
      sidebar = {
        close_from_input = { normal = '<Esc>', insert = '<C-d>' },
      },
    },
    windows = {
      width = 40,
      edit = { start_insert = true },
      ask = { start_insert = true },
      input = {
        -- height = 12,
        provider = 'snacks',
        provider_opts = {
          title = 'Avante Input',
          icon = ' ',
        },
      },
    },
    suggestion = {
      debounce = 1200,
      throttle = 1200,
    },
    system_prompt = function()
      local hub = require('mcphub').get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ''
    end,
    custom_tools = function()
      return {
        require('mcphub.extensions.avante').mcp_tool(),
      }
    end,
  },
  dependencies = {
    'folke/snacks.nvim', -- input provider
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.pick',
    'nvim-telescope/telescope.nvim',
    'stevearc/dressing.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
    -- {
    --   -- support for image pasting
    --   'HakonHarnes/img-clip.nvim',
    --   event = 'VeryLazy',
    --   opts = {
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --     },
    --   },
    -- },
  },
}
