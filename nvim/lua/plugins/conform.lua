require("conform").setup(
    {
        formatters_by_ft = {
            python = { 'ruff_format' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    }

)
