return {
  'vim-test/vim-test',
  cmd = {
    'TestNearest',
    'TestFile',
    'TestSuite',
    'TestLast',
    'TestVisit',
  },
  keys = {
    { '<leader>uu', '<cmd>TestNearest -strategy=toggleterm<CR>', desc = '[U]nit [n]earest', silent = true, noremap = true },
    { '<leader>uf', '<cmd>TestFile -strategy=wezterm<CR>', desc = '[U]nit [f]ile', silent = true, noremap = true },
    -- { '<leader>us', '<cmd>TestSuite -strategy=wezterm<CR>', desc = '[U]nit [s]suite', silent = true, noremap = true },
    { '<leader>ul', '<cmd>TestLast -strategy=toggleterm<CR>', desc = '[U]nit [l]last', silent = true, noremap = true },
  },
}
