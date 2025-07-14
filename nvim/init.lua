-- Settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.o.number = true
vim.opt.termguicolors = true

-- Keybind
require("config.lazy")

-- Nvim Tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- Tmux Navigator
vim.keymap.set('n', 'C-h', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', 'C-j', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', 'C-k', ':TmuxNavigateUp<CR>')
vim.keymap.set('n', 'C-l', ':TmuxNavigateRight<CR>')

-- LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})

-- Telescope
vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
    require("telescope.builtin").live_grep()
end, { desc = "Live Grep (Search in Files)" })

vim.keymap.set("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
end, { desc = "Find Buffers" })

vim.keymap.set("n", "<leader>fh", function()
    require("telescope.builtin").help_tags()
end, { desc = "Find Help" })
