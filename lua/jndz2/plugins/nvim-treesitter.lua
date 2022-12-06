local treesitter_configs_status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not treesitter_configs_status then
  return
end

treesitter_configs.setup({
  ensure_installed = {
    "lua",
    "rust",
    "toml",
    "go",
    "markdown",
    "dockerfile",
    "gitignore",
    "bash",
    "json",
    "html",
    "css",
    "yaml",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  ident = { enable = true },
  autopairs = {
    enable = true,
  },
})
