-- lua/config/lsp.lua
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP key mappings function
local function on_attach(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
end



-- Setup clangd
require('lspconfig').clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
    fallbackFlags = { "-std=c++17" },
  },
}

 require('lspconfig').lua_ls.setup {
    settings = {
	Lua = {
	    diagnostics = {
		globals = {'vim'}, -- Add Neovim globals to avoid false positives
	    },
	    workspace = {
		checkThirdParty = false, -- Adjust as needed
	    },
	    telemetry = {
		enable = false,
	    },
	},
    },
}
   

-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = {
    wrap = true,  -- Allow error messages to wrap to next line
    spacing = 4,
  },
  signs = false,  -- Remove the symbols on the left side
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
