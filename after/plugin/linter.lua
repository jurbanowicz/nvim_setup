require('lint').linters_by_ft = {
    python = {'pylint',}
}


local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        python = {"isort", "black", "autopep8"}
    }
})

vim.keymap.set({"n", "v"}, "<leader>mp", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
    })
end, {desc = "Format file or selected (visual mode)"})

