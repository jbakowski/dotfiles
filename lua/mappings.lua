require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<F2>", "<cmd>Lspsaga hover_doc ++keep<CR>", { silent = true, noremap = true })
map("n", "<F3>", "<cmd>Lspsaga peek_definition<CR>", { silent = true, noremap = true })

map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true, noremap = true })
map("n", "<F6>", ":lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
map("n", "<F7>", ":lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
map("n", "<F8>", ":lua require'dap'.step_out()<CR>", { silent = true, noremap = true })
map("n", "<Leader>bp", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true, noremap = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
