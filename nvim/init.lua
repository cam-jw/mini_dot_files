--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini                           ║
--          ╚═════════════════════════════════════════════════════════╝
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.uv.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/echasnovski/mini.nvim",
        mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags all")
    vim.cmd('echo "installed `mini.nvim`" | redsaw')
end


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.deps                      ║
--          ╚═════════════════════════════════════════════════════════╝
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later



--          ╔═════════════════════════════════════════════════════════╗
--          ║                          treesitter & lsp               ║
--          ╚═════════════════════════════════════════════════════════╝
add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim'  },
})

add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main',
    hooks = { post_checkout = function() vim.cmd('tsupdate') end },
})

add({
    source = 'stevearc/conform.nvim'
})

add({
    source = 'nvim-tools/none-ls.nvim',
    depends = { 'nvim-lua/plenary.nvim' }
})


require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'python' },
    highlight = { enable = true },
})
require("mason").setup()
require("mason-lspconfig").setup()


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          nvim.options                   ║
--          ╚═════════════════════════════════════════════════════════╝
now(function()
    vim.g.mapleader = " "
    vim.o.number = true
    vim.o.relativenumber = false
    vim.o.laststatus = 2
    vim.o.list = true
    vim.o.listchars = table.concat({ "extends:…", "nbsp:␣", "precedes:…", "tab:> " }, ",")
    vim.o.autoindent = true
    vim.o.shiftwidth = 4
    vim.o.tabstop = 4
    vim.o.expandtab = true
    vim.o.scrolloff = 10
    vim.o.clipboard = "unnamed,unnamedplus"
    vim.o.updatetime = 1000
    vim.opt.iskeyword:append("-")
    vim.o.spelllang = "en"
    vim.o.spelloptions = "camel"
    vim.opt.complete:append("kspell")
    vim.o.path = vim.o.path .. ",**"
    vim.o.tags = vim.o.tags .. ",/home/dosa/.config/nvim/tags"
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.align                     ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.align").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.animate                   ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    local animate = require("mini.animate")
    animate.setup({
        scroll = {
            enable = false,
        },
        cursor = {
            timing = animate.gen_timing.cubic({ duration = 120, unit = "total" }),
        },
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.basics                    ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.basics").setup({
        options = {
            basic = true,
            extra_ui = true,
            win_borders = "bold",
        },
        mappings = {
            basic = true,
            windows = true,
        },
        autocommands = {
            basic = true,
            relnum_in_visual_mode = true,
        },
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.bracket                   ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.bracketed").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.bufremove                 ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.bufremove").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.clue                      ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.clue").setup({
        triggers = {
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },

            { mode = "n", keys = "\\" },

            -- Built-in completion
            { mode = "i", keys = "<C-x>" },

            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },

            -- Marks
            { mode = "n", keys = "'" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "'" },
            { mode = "x", keys = "`" },

            -- Registers
            { mode = "n", keys = '"' },
            { mode = "x", keys = '"' },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },

            -- Window commands
            { mode = "n", keys = "<C-w>" },

            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
        },

        clues = {
            { mode = "n", keys = "<Leader>b", desc = " buffer" },
            { mode = "n", keys = "<Leader>f", desc = " find" },
            { mode = "n", keys = "<Leader>g", desc = "󰊢 git" },
            -- { mode = "n", keys = "<Leader>i", desc = "󰏪 Insert" },
            { mode = "n", keys = "<Leader>l", desc = "󰘦 lsp"},
            -- { mode = "n", keys = "<Leader>q", desc = " NVim" },
            -- { mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
            { mode = "n", keys = "<Leader>u", desc = "󰔃 ui" },
            -- { mode = "n", keys = "<Leader>w", desc = " Window" },
            require("mini.clue").gen_clues.g(),
            require("mini.clue").gen_clues.builtin_completion(),
            require("mini.clue").gen_clues.marks(),
            require("mini.clue").gen_clues.registers(),
            require("mini.clue").gen_clues.windows(),
            require("mini.clue").gen_clues.z(),
        },
        window = {
            delay = 300,
        },
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.comment                   ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.comment").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.completion                ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.completion").setup({})
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.cursorword                ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.cursorword").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.diff                      ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.diff").setup({
        view = {
            style = "sign",
            signs = { add = "█", change = "▒", delete = "" },
        },
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.files                     ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.files").setup({
        mappings = {
            close = '<ESC>',
        },
        windows = {
            preview = true,
            border = "solid",
            width_preview = 80,
        },
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.fuzzy                     ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.fuzzy").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.git                       ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.git").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.icons                     ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.icons").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.indentscope               ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.indentscope").setup({
        draw = {
            animation = function()
                return 1
            end,
        },
        symbol = "│",
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.jump                      ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.jump").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.map                       ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.map").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.pairs                     ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.pairs").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.pick                      ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.pick").setup({
        mappings = {
            choose_in_vsplit = "<C-CR>",
            -- move_down = "<C-j>",
            -- move_up = "<C-k>",
        },
        options = {
            use_cache = true,
        },
    })
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.splitjoin                 ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.splitjoin").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.statusline                ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.statusline").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.surround                  ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.surround").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.tabline                   ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.tabline").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.trailspace                ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.trailspace").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.visits                    ║
--          ╚═════════════════════════════════════════════════════════╝
later(function()
    require("mini.visits").setup()
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          mini.starter                   ║
--          ╚═════════════════════════════════════════════════════════╝
now(function()
    require("mini.starter").setup(
    {
        autoopen = true,
        evaluate_single = false,
        items = {
            { name = '', action = 'lua print(math.random())', section = '' },
        },
        header = "vim",
        footer = "",
        content_hooks = nil,
        query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
        silent = false,
    }
    )
end)


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          colorscheme                    ║
--          ╚═════════════════════════════════════════════════════════╝
add({
    source = "zenbones-theme/zenbones.nvim",
    depends = {"rktjmp/lush.nvim"},
})
add({
    source = "gbprod/nord.nvim",
})
add({
    source = "sainnhe/gruvbox-material",
})
vim.cmd("colorscheme gruvbox-material")


--          ╔═════════════════════════════════════════════════════════╗
--          ║                          dependencies                   ║
--          ╚═════════════════════════════════════════════════════════╝
require("config/keybinds")
require("plugins/nvim-lspconfig")
require("plugins/nvim-treesitter")
require("plugins/tmux-navigator")
require("plugins/conform")
require("plugins/none-ls")


vim.diagnostic.config({ virtual_text = false })
