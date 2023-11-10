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
    kitty = {
      enabled = true,
      font = "+2",
    },
  },
})
