vim.pack.add({
  {
    src = "https://github.com/lewis6991/gitsigns.nvim",
    version = "42d6aed4e94e0f0bbced16bbdcc42f57673bd75e",
  },
})

vim.pack.add({
  {
    src = "https://github.com/catppuccin/nvim",
    version = "cb5665990a797b102715188e73c44c3931b3b42e",
  },
})

vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "45a07f869b0cffba342276f2c77ba7c116d35db8",
  },
})

require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.treesitter")
