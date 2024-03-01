-- local lsp_zero = require('lsp-zero').preset({manage_nvim_cmp = false})
-- local lsp_zero = require('lsp-zero')
-- 
-- lsp_zero.on_attach(function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lsp_zero.default_keymaps({ buffer = bufnr })
-- 
--     local opts = { buffer = bufnr }
--     vim.keymap.set({ 'n', 'x' }, '<leader>pv', function()
--         vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
--     end, opts)
-- end)
-- 
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = { "pyright", "lua_ls" },
--     handlers = {
--         lsp_zero.default_setup,
--     },
-- })

local lsp_zero = require('lsp-zero')

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp_zero.on_attach(on_attach)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'pyright', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    -- {name = 'buffer'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})


cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {name = 'buffer'}
    }
})


cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        {name = 'path'}
    }, {
        {name = 'cmdline',
        option = {
            ignore_cmds = {'Man', '!'}
            }
        }
    })
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_config = require('lspconfig')

lsp_config["dartls"].setup({
    on_attach = on_attach,
    settings = {
        dart = {
            analysisExcludedFolders = {
                vim.fn.expand("$HOME/tools/flutter"),
                vim.fn.expand("$HOME/.pub-cache/"),
            },
        }
    }
})

lsp_zero.setup()



-- require("dart-tools")

