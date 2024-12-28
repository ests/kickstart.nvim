return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git', -- also try out "git_branch"
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>M', '<cmd>Grapple toggle<cr>', desc = 'Toggle grapple tag' },
    { '<leader>m', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
    -- { '<leader>t', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
    -- { '<leader>T', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
  },
}
