-- Setup language servers.
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.pyright.setup ({
    capabilities = capabilities,
})
lspconfig.lua_ls.setup {}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})



-- local api = vim.api
-- local keymap = vim.keymap.set
--
-- local function keymappings(_, bufnr)
--   local opts = { noremap = true, silent = true }
--
--   keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
--   keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
--   keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--   keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
--   keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
--
--   keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--   keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   keymap("n", "gb", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--
--   api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
--   api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
-- end
--
-- local function highlighting(client, bufnr)
--   if client.server_capabilities.documentHighlightProvider then
--     local lsp_highlight_grp = api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
--     api.nvim_create_autocmd("CursorHold", {
--       callback = function()
--         vim.schedule(vim.lsp.buf.document_highlight)
--       end,
--       group = lsp_highlight_grp,
--       buffer = bufnr,
--     })
--     api.nvim_create_autocmd("CursorMoved", {
--       callback = function()
--         vim.schedule(vim.lsp.buf.clear_references)
--       end,
--       group = lsp_highlight_grp,
--       buffer = bufnr,
--     })
--   end
-- end
--
-- local function lsp_handlers()
--   local diagnostics = {
--     Error = "",
--     Hint = "",
--     Information = "",
--     Question = "",
--     Warning = "",
--   }
--   local signs = {
--     { name = "DiagnosticSignError", text = diagnostics.Error },
--     { name = "DiagnosticSignWarn", text = diagnostics.Warning },
--     { name = "DiagnosticSignHint", text = diagnostics.Hint },
--     { name = "DiagnosticSignInfo", text = diagnostics.Info },
--   }
--   for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
--   end
--
--   -- LSP handlers configuration
--   local config = {
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--     },
--
--     diagnostic = {
--       virtual_text = { severity = vim.diagnostic.severity.ERROR },
--       signs = {
--         active = signs,
--       },
--       underline = true,
--       update_in_insert = false,
--       severity_sort = true,
--       float = {
--         focusable = true,
--         style = "minimal",
--         border = "rounded",
--         source = "always",
--         header = "",
--         prefix = "",
--       },
--     },
--   }
--
--   vim.diagnostic.config(config.diagnostic)
--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
-- end
--
-- local function formatting(client, bufnr)
--   if client.server_capabilities.documentFormattingProvider then
--     local function format()
--       local view = vim.fn.winsaveview()
--       vim.lsp.buf.format({
--         async = true,
--         filter = function(attached_client)
--           return attached_client.name ~= ""
--         end,
--       })
--       vim.fn.winrestview(view)
--     end
--
--     local lsp_format_grp = api.nvim_create_augroup("LspFormat", { clear = true })
--     api.nvim_create_autocmd("BufWritePre", {
--       callback = function()
--         vim.schedule(format)
--       end,
--       group = lsp_format_grp,
--       buffer = bufnr,
--     })
--   end
-- end
--
-- local function on_attach(client, bufnr)
--   if client.server_capabilities.completionProvider then
--     vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
--     vim.bo[bufnr].completefunc = "v:lua.vim.lsp.omnifunc"
--   end
--
--   if client.server_capabilities.definitionProvider then
--     vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
--   end
--
--   if client.server_capabilities.documentFormattingProvider then
--     vim.bo[bufnr].formatexpr = "v:lua.vim.lsp.formatexpr()"
--   end
--
--   keymappings(client, bufnr)
--   highlighting(client, bufnr)
--   formatting(client, bufnr)
-- end
--
-- lsp_handlers()
--
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     on_attach(client, bufnr)
--   end,
-- })
