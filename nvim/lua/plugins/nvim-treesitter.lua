local ensure_installed = { 'bash',   'json', 'lua',  'markdown', 'markdown_inline', 'python',  'toml', 'yaml',   'vim', 'vimdoc', }

require('nvim-treesitter.configs').setup({
  ensure_installed = ensure_installed,
  highlight = { enable = true },
  incremental_selection = { enable = false },
  textobjects = { enable = false },
  indent = { enable = false },
})
