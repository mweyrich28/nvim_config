function ColorMyPencils(color)
    -- color = color or "catppuccin"
    -- color = color or "gruvbox"
    -- color = color or "melange"
    color = color or "nord"
    vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end

ColorMyPencils()

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false

-- Load the colorscheme
require('nord').set()

-- vim.cmd([[hi VimwikiHeader6 guifg=#b3cf99]])
-- vim.cmd([[hi VimwikiHeader5 guifg=#a3c585]])
-- vim.cmd([[hi VimwikiHeader4 guifg=#95bb72]])
-- vim.cmd([[hi VimwikiHeader3 guifg=#87ab69]])
-- vim.cmd([[hi VimwikiHeader2 guifg=#75975e]])
-- vim.cmd([[hi VimwikiHeader1 guifg=#658354]])
