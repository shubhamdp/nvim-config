require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- some telescope helpers
map('n', '<leader>ff', '<cmd>Telescope git_files<cr>', { desc = "find git files" })
map('n', '<leader>fg', function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")}) end, { desc = "live grep" })

-- undotree
map('n', '<leader>u', ':UndotreeToggle<cr>', { desc = "Toggle undotree" })
