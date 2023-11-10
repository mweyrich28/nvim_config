local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..." vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins


    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"}
    use "hrsh7th/cmp-nvim-lua"
    use{"quangnguyen30192/cmp-nvim-ultisnips"}

	-- Mason LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'

    -- Commenting
    use { "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" }

    -- Auto pairs
    use { "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" } -- Autopairs, integrates with both cmp and treesitter

    -- Indent lines
    use { "lukas-reineke/indent-blankline.nvim" }

    -- UI (Nvim-Tree, Bufferline, ToggleTerm, Lualine)
    use { "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" }
    use { "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }
    use { "akinsho/bufferline.nvim", tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  		require("toggleterm").setup()
	end}
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- TUI stuff
    use { "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" }
    use { "goolord/alpha-nvim"}

    -- Buffer closing
    -- use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }

    -- Color highlighter
    use "norcalli/nvim-colorizer.lua"

    -- sudo editing
    -- use "lambdalisue/suda.vim"

    -- Startup time optimizer
    -- use { "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" }

    -- Startup time benchmark
    -- use "dstein64/vim-startuptime"

    -- Filetype Specific
    -- use "udalov/kotlin-vim"
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })

	-- use 'mhinz/neovim-remote'

    -- my stuff 
    use 'lervag/vimtex'
    use { "ellisonleao/gruvbox.nvim" }
    use ('ThePrimeagen/harpoon')

    use ('mbbill/undotree')

	-- Vimwiki 
	use {
        'vimwiki/vimwiki',
	}

		-- Trouble plugin
		-- use {
		-- 	"folke/trouble.nvim",
		-- 	requires = "nvim-tree/nvim-web-devicons",
		-- 	config = function()
		-- 		require("trouble").setup {
		-- 			-- your configuration comes here
		-- 			-- or leave it empty to use the default settings
		-- 			-- refer to the configuration section below
		-- 		}
		-- 	end
		-- }

    use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
   
	use({
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-textobjects",
    })


	-- Snippets
    use("SirVer/ultisnips")
    use("honza/vim-snippets")

	-- Colorschemes
	use "savq/melange-nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'shaunsingh/nord.nvim'
	-- use 'gilgigilgil/anderson.vim'
	-- use "VDuchauffour/neodark.nvim"


	-- Zen mode
	use {
		"folke/zen-mode.nvim",
		-- opts = {
		-- 	number = false,
		-- 	relativenumber = false,
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		-- }
	}
	use {
		'lewis6991/gitsigns.nvim',
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	}

	use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
        "nvim-lua/plenary.nvim",
    	},
	})

	use {"christoomey/vim-tmux-navigator"}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		-- config = function()
		-- 	require("todo-comments").setup()
		-- end,
	}

	-- QhickScope
	use 'unblevable/quick-scope'

	-- ChatGPT
	use {
		"dreamsofcode-io/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		},
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "echo $OPENAI_API_KEY",
			})
		end

	}

	-- Copilot
	use { "github/copilot.vim" }

	-- md
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	-- TaskWarrior
	use { "blindFS/vim-taskwarrior" }

	-- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
