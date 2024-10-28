vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.opt.exrc = true
vim.g.python3_host_prog = "/Users/shubhampatil/esp/connectedhomeip/.environment/pigweed-venv/bin/python3"

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true

-- inheriting some stuff from ~/.vimrc
vim.cmd([[


set ruler
set backspace=indent,eol,start

set tags+=tags;/
set tags+=~/esp/esp-idf/tags
set tags+=~/esp/esp-matter/tags
set tags+=~/esp/connectedhomeip/tags

nnoremap tt :tabedit 
vnoremap <C-c> "+y
nnoremap ! :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]])

vim.api.nvim_set_keymap("n", "tt", ":tabedit", { noremap = true })

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter'
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
