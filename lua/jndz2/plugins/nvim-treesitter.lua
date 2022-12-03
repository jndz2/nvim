local treesitter_config_status, treesitter_config = pcall(require, "nvim-treesitter.config")
if not treesitter_config_status then
	return
end

treesitter_config.setup({
	ensure_installed = {
		"lua",
		"rust",
		"toml",
		"go",
		"toml",
		"markdown",
		"dockerfile",
		"gitignore",
		"bash",
		"json",
		"html",
		"css",
		"yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	ident = { enable = true },
  autopairs = {
		enable = true,
	},
})
