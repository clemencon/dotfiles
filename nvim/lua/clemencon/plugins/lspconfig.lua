-- Run :LspInfo to see current LSP servers.

-- Setup Mason to automatically install LSP servers.
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })
local lspconfig = require('lspconfig')

-- PHP
local get_intelephense_license = function ()
    local file = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = file:read("*a")
    file:close()
    return string.gsub(content, "%s+", "")
end

lspconfig.intelephense.setup{
  init_options = { licenceKey = get_intelephense_license() }
}

-- JavaScript
lspconfig.volar.setup{
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

-- Tailwind CSS
lspconfig.tailwindcss.setup{}

-- Global mappings
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>') -- vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'K', vim.lsp.buf.hover) -- Press twice to jump into the hover.
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>') -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

-- Diagnostics configuration
vim.diagnostic.config({
    virtual_text = false,
    float = { source = true }
})

vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })

