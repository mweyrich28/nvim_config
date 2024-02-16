local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function reset_logo_hls()
    local green = vim.g.terminal_color_2
    local blue = vim.g.terminal_color_4
    local gray = vim.api.nvim_get_hl(0, { name = "Comment" }).fg

    vim.api.nvim_set_hl(0, "YonvimDashboardLogo1", { fg = blue })
    vim.api.nvim_set_hl(0, "YonvimDashboardLogo2", { fg = green })
    vim.api.nvim_set_hl(0, "YonvimDashboardLogo3", { fg = green, bg = blue })
    vim.api.nvim_set_hl(0, "YonvimDashboardFooter", { fg = gray })
end

dashboard.section.header.val = {
		-- [[                               __                ]],
		-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		-- [[                                                 ]],
		-- [[                                                                       ]],
		-- [[  ██████   █████                   █████   █████  ███                  ]],
		-- [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
		-- [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
		-- [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
		-- [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
		-- [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
		-- [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
		-- [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],

		[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠉⣉⣉⠙⠿⠋⣠⢴⣊⣙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⢀⠔⡩⠔⠒⠛⠧⣾⠊⢁⣀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⡡⠊⠀⠀⣀⣠⣤⣌⣾⣿⠏⠀⡈⢿⡜⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⣤⣶⠏⢁⠈⢻⡏⠙⠛⠀⣀⣁⣤⢢⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣄⡀⠣⣌⡙⠀⣘⡁⠜⠈⠑⢮⡭⠴⠚⠉⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⠁⠀⢀⠔⠁⣀⣤⣤⣤⣤⣤⣄⣀⠀⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠁⠀⢀⣠⢠⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⡀⠀⢸⠀⢼⣿⣿⣶⣭⣭⣭⣟⣛⣛⡿⠷⠶⠶⢶⣶⣤⣤⣤⣶⣶⣾⡿⠿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠈⠉⠉⠉⠉⠉⠙⠛⠛⠻⠿⠿⠿⠷⣶⣶⣶⣶⣶⣶⣶⣶⡾⢗⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣝⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    -- "                                                     ",
    -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    -- "                                                     ",
}
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Normal"
  b.opts.hl_shortcut = "Identifier"
  return b
end

dashboard.section.buttons.val = {
  -- button("b", "󱞊  > Browse", ":e . <CR>" ),
  button("p", "  > Find Projects", ":lua require('telescope').extensions.projects.projects()<CR>"),
  button("f", "󰱼  > Find File   ", ":Telescope find_files <CR>"),
  button("r", "󱈖  > Recent Files   ", ":Telescope oldfiles <CR>"),
  button("m", "  > Markdown Wiki", ":e ~/documents/vimwiki/index.md<CR>" ),
  button("s", "  > Edit Snippets", ":e ~/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/tex.snippets <CR>" ),
  button("c", "  > Edit Config", ":e ~/.config/nvim/init.lua <CR><CR>"),
  -- button("q", "  > Quit", ":qa<CR>"),
  -- button("g", "󱎸  > Live Grep ", ":Telescope live_grep <CR>"),
}
dashboard.section.buttons.opts = {
  spacing = 1,
  position = "center"
}

local function footer()
	local date = os.date("%d.%m.%Y")
	-- local time = os.date("%H:%M")
    -- show ram usage
    local ram = vim.fn.system("free -h | awk 'NR==2{print $3}'")

return date .. " | " .. ram
end
dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Identifier"
dashboard.section.header.opts.hl = "Type"
dashboard.section.header.opts.spacing = "center"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
-- possible keyword values: Normal, Identifier, Statement, PreProc, Type, Comment





