local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end 

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
		[[                               __                ]],
		[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		[[                                                 ]],
		-- [[                                                                       ]],
		-- [[  ██████   █████                   █████   █████  ███                  ]],
		-- [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
		-- [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
		-- [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
		-- [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
		-- [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
		-- [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
		-- [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],

		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠉⣉⣉⠙⠿⠋⣠⢴⣊⣙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⢀⠔⡩⠔⠒⠛⠧⣾⠊⢁⣀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⡡⠊⠀⠀⣀⣠⣤⣌⣾⣿⠏⠀⡈⢿⡜⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠡⣤⣶⠏⢁⠈⢻⡏⠙⠛⠀⣀⣁⣤⢢⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣄⡀⠣⣌⡙⠀⣘⡁⠜⠈⠑⢮⡭⠴⠚⠉⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⠁⠀⢀⠔⠁⣀⣤⣤⣤⣤⣤⣄⣀⠀⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠁⠀⢀⣠⢠⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⡀⠀⢸⠀⢼⣿⣿⣶⣭⣭⣭⣟⣛⣛⡿⠷⠶⠶⢶⣶⣤⣤⣤⣶⣶⣾⡿⠿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠈⠉⠉⠉⠉⠉⠙⠛⠛⠻⠿⠿⠿⠷⣶⣶⣶⣶⣶⣶⣶⣶⡾⢗⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣝⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    -- "                                                     ",
    -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    -- "                                                     ",
}
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Comment"
  b.opts.hl_shortcut = "Comment"
  return b
end

dashboard.section.buttons.val = {
  button("m", "  > Markdown Wiki", ":e ~/01_Documents/Vimwiki_md/index.md<CR>" ),
  button("t", "  > Taskwarrior", ":TW<CR>" ),
  button("f", "󰱼  > Find File   ", ":Telescope find_files <CR>"),
  button("p", "  > Find Projects", ":lua require('telescope').extensions.projects.projects()<CR>"),
  button("g", "󱎸  > Live Grep ", ":Telescope live_grep <CR>"),
  button("r", "󱈖  > Recent Files   ", ":Telescope oldfiles <CR>"),
  button("s", "  > Edit Snippets", ":e ~/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/tex.snippets <CR> :set autochdir <CR>" ),
  button("c", "  > Edit Config", ":e ~/.config/nvim/init.lua <CR> :set autochdir <CR>"),
  button("q", "  > Quit", ":qa<CR>"),
}
dashboard.section.buttons.opts = {
  spacing = 1,
  position = "center"
}

local function footer()
	local date = os.date(" %d-%m-%Y")
	local time = os.date(" %H:%M")
	return date .. "                                   BIO\n" .. time .. "                                 INFORMATIK"
	-- return "       BIO\nINFORMATIK\n   TUM LMU"
	-- return date
end
-- dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Identifier"
dashboard.section.header.opts.hl = "Normal"
dashboard.section.header.opts.spacing = "center"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
