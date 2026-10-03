-- Highlight yanked text
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ timeout = 170 })
  end,
  group = highlight_group,
})

-- Treesitter start based on file types
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'go',
    'lua',
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  callback = function() vim.treesitter.start() end,
})

-- gopls goimports on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(event)
  vim.lsp.buf.format({
    bufnr = event.buf,
    async = false,
  })
  end,
})

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
  local opts = {
    buffer = event.buf,
  }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

-- Enable built-in LSP completion when a client that supports
-- textDocument/completion attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)

  if client and client:supports_method("textDocument/completion") then
    vim.lsp.completion.enable(
      true,
      client.id,
      event.buf,
      {
        autotrigger = true,
      }
    )
    end
    end,
})
