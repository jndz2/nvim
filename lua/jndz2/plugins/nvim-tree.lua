local nvimtree_status, nvim_tree = pcall(require, "nvim-tree")
if not nvimtree_status then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	view = {
		side = "left",
	},
})
