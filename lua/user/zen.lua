require("zen-mode").setup({
  window = {
    width = 90,
    options = {
      number = false,
      relativenumber = false,
      signcolumn = "no",
      cursorcolumn = false,
	  cursorline = false,
    },
  },
  plugins = {
	  gitsigns = { enabled = false }, -- disables git signs
	  tmux = { enabled = false }, -- disables the tmux statusline
	alacritty = {
      enabled = false,
      font = "14", -- font size
    },
  },
})
