-- Custom keymaps
local keymap = vim.keymap.set

-- Map Ctrl+s to save the current buffer
keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = 'Save current buffer' })
keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save current buffer' })
keymap('v', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true, desc = 'Save current buffer' })

-- custom basics
keymap('n', 'Q', '<Nop>', { noremap = true, silent = true })
keymap('n', 'q', '<Nop>', { noremap = true, silent = true })
keymap('n', '*', '*<c-o>', { noremap = true, silent = true })
keymap('n', '<leader>x', '<cmd>Bdelete<cr>', { noremap = true, silent = true, desc = 'Close buffer' })
keymap('n', '<leader>X', '<cmd>bdelete<cr>', { noremap = true, silent = true, desc = 'Close buffer (unlisted)' })

-- save all quit
local function save_all_and_quit()
  -- Get the list of all buffers
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    -- Check if the buffer is loaded, modifiable, and has a filename
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modifiable and vim.api.nvim_buf_get_name(buf) ~= '' then
      -- Save the buffer
      vim.api.nvim_buf_call(buf, function()
        vim.cmd 'silent update'
      end)
    end
  end
  -- Quit Neovim, closing all windows and discarding any changes in buffers that couldn't be saved
  vim.cmd 'qa!'
end
keymap('n', '<c-x>', save_all_and_quit, { noremap = true, silent = true, desc = 'Save all and quit' })

-- movement (window navigation)
keymap({ 'n', 'v' }, '<c-h>', '<c-w>h', { noremap = true, silent = true, desc = 'Move focus to the left window' })
keymap({ 'n', 'v' }, '<c-j>', '<c-w>j', { noremap = true, silent = true, desc = 'Move focus to the lower window' })
keymap({ 'n', 'v' }, '<c-k>', '<c-w>k', { noremap = true, silent = true, desc = 'Move focus to the upper window' })
keymap({ 'n', 'v' }, '<c-l>', '<c-w>l', { noremap = true, silent = true, desc = 'Move focus to the right window' })

-- toggle last buffers
keymap('n', ',,', '<cmd>b#<cr>', { noremap = true, silent = true, desc = 'Toggle last buffer' })

-- visual mode move lines
keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, desc = 'Move line up' })
keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, desc = 'Move line down' })

-- visual indent
keymap('v', '<', '<gv', { noremap = true, silent = true, desc = 'Indent left' })
keymap('v', '>', '>gv', { noremap = true, silent = true, desc = 'Indent right' })

-- global abbrevs (commented out)
-- vim.cmd [[iab <expr> dti strftime("%Y-%m-%d")]]
-- vim.cmd [[iab <expr> dtl strftime("%y.%m.%d")]]
-- vim.cmd [[iab <expr> dts strftime("%m.%d")]]

-- Easy system clipboard paste
keymap({'n', 'v'}, '<leader>v', '"+p', { noremap = true, silent = true, desc = 'Paste from system clipboard' })
keymap({'n', 'v'}, '<leader>V', '"+P', { noremap = true, silent = true, desc = 'Paste before cursor from system clipboard' })

return {}
