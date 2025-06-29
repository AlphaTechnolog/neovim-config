-- install lazy.nvim
require("setup.lazy")

local opt = vim.opt

-- options
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.number = true
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.cursorline = false
opt.autoindent = true
opt.showmode = false
-- opt.guicursor = 'i:block'

-- autocmds
vim.cmd [[ autocmd FileType lua setlocal tabstop=3 shiftwidth=3 expandtab ]]

-- keymaps
vim.keymap.set('n', '<Tab>', '<cmd>bn!<cr>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bp!<cr>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>bd!<cr>', { desc = 'Close buffer' })
vim.keymap.set('n', ';', ':', { desc = 'Easily go to cmdline' })

for _, key in ipairs {'jk', 'jj', 'kj', 'kk'} do
   vim.keymap.set('i', key, '<esc>', { desc = 'Go to normal mode in insert mode' })
end

for _, key in ipairs {'h', 'j', 'k', 'l'} do
   vim.keymap.set('n', '<C-' .. key .. '>', '<C-w>' .. key, { desc = 'Move dir' })
end

-- custom commands

-- call gh repo view --web when doing :repoview
vim.api.nvim_create_user_command('RepoView', function ()
   local command = 'gh repo view --web'
   local handle = io.popen(command)
   if handle ~= nil then
      handle:close()
   end
end, {})

vim.cmd.cabbrev 'repoview RepoView'
-- vim.cmd.colorscheme 'pastel_dark_terminal'

-- auto update plugins
local function augroup(name)
   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
   group = augroup("autoupdate"),
   callback = function()
      local lazy = require("lazy")
      local status = require("lazy.status")
      if status.has_updates() then
         lazy.update({ show = false })
      end
   end
})

vim.keymap.set('n', '<leader>n', function ()
   vim.o.number = not vim.o.number
end, { desc = "Toggle line number" })

vim.cmd [[ set path+=** ]]
