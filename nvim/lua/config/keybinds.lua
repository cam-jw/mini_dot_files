-- ╔═══════════════════════╗
-- ║    Local Variables    ║
-- ╚═══════════════════════╝
local keymap = vim.keymap.set


-- ╔════════════════════╗
-- ║    Find Keymaps    ║
-- ╚════════════════════╝
keymap("n", "<leader>ff", function() require('mini.pick').builtin.files() end,
    { desc = 'file' })
keymap("n", "<leader>fe", function()
        local buffer_name = vim.api.nvim_buf_get_name(0)
        if buffer_name == "" or string.match(buffer_name, "Starter") then
            require('mini.files').open(vim.loop.cwd())
        else
            require('mini.files').open(vim.api.nvim_buf_get_name(0))
        end
    end,
    { desc = 'explore' })
keymap("n", "<leader>fg", function() require('mini.pick').builtin.grep_live() end,
    { desc = 'grep' })
keymap("n", "<leader>fG", function()
        local wrd = vim.fn.expand("<cword>")
        require('mini.pick').builtin.grep({ pattern = wrd })
    end,
    { desc = 'grep cursor' })
keymap("n", "<leader>fh", function() require('mini.pick').builtin.help() end,
    { desc = 'help' })
keymap('n', ',', function() require('mini.extra').pickers.buf_lines({ scope = 'current' }) end,
    { nowait = true, desc = 'lines' })


-- ╔══════════════════════╗
-- ║    Buffer Keymaps    ║
-- ╚══════════════════════╝
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = 'close buffer' })
keymap("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = 'close other buffers' })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = 'clockwise' })
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = 'anti clockwise' })
keymap("n", "<leader>bf", "gg=G<C-o>", { desc = 'format' })


-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝
keymap("n", "<leader>fs", "<cmd>Pick lsp scope='document_symbol'<cr>",
    { desc = 'symbols' })
keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = 'rename' })
keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,
    { desc = 'actions' })
keymap("n", "<leader>fd", function() require('mini.extra').pickers.diagnostic({ scope = "current" }) end,
    { desc = "diagnostics" })
keymap("n", "<leader>lf", function()
    vim.diagnostic.setqflist({ open = true })
end, { desc = "quickfix" })
keymap("n", "<leader>lf", function() vim.lsp.buf.format() end,
    { desc = 'format' })
keymap("n", "<leader>ld", function() vim.diagnostic.open_float() end,
    { desc = 'diagnostic' })

if vim.tbl_isempty(vim.lsp.buf_get_clients()) then
    keymap("n", "gd", function() vim.lsp.buf.definition() end,
        { desc = 'definition' })
else
    keymap("n", "gd", "gd", { desc = 'definition' })
end


-- ╔══════════════════╗
-- ║    UI Keymaps    ║
-- ╚══════════════════╝
-- Window Navigation
keymap("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = 'left' })
keymap("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = 'up' })
keymap("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = 'down' })
keymap("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = 'right' })


-- ╔═══════════════════╗
-- ║    Git Keymaps    ║
-- ╚═══════════════════╝
keymap("n", "<leader>fc", function() require('mini.extra').pickers.git_commits({ path = vim.fn.expand('%:p') }) end,
    { desc = 'log current file' })
keymap("n", "<leader>gp", "<cmd>:Git pull<cr>", { desc = 'push' })
keymap("n", "<leader>gs", "<cmd>:Git push<cr>", { desc = 'pull' })
keymap("n", "<leader>ga", "<cmd>:Git add .<cr>", { desc = 'add .' })
keymap("n", "<leader>gl", "<cmd>:terminal lazygit<cr>", {desc = 'lazy'})

keymap("", "<leader>gh", function() require('mini.git').show_range_history() end,
    { desc = 'range history' })
keymap("n", "<leader>gb", function() require('mini.git').show_at_cursor() end,
    { desc = 'git blame at cursor' })

--  ─( Change Colorscheme )─────────────────────────────────────────────
keymap("n", "<leader>ud", "<cmd>set background=dark<cr>", { desc = 'dark' })
keymap("n", "<leader>ul", "<cmd>set background=light<cr>", { desc = 'light' })
keymap("n", "<leader>um", "<cmd>lua MiniMap.toggle()<cr>", { desc = 'map' })
