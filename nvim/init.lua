vim.g.mapleader = ' '

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Set theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox-material]])

-- General settings
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- nvim-tree bindings
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Dynamic navigation for Neovim splits and Tmux panes
local in_tmux = os.getenv("TMUX") ~= nil

if in_tmux then
  -- Use Tmux navigator if in Tmux
  vim.keymap.set('n', '<C-h>', '<Cmd>TmuxNavigateLeft<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-j>', '<Cmd>TmuxNavigateDown<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-k>', '<Cmd>TmuxNavigateUp<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-l>', '<Cmd>TmuxNavigateRight<CR>', { noremap = true, silent = true })
else
  -- Default split navigation when not in Tmux
  vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
end

-- Telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
