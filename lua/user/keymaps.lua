local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap C-c to <esc>
keymap("i", "<C-c>", "<Esc>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- better paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<leader>pf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>rr", "<cmd>Telescope live_grep<cr>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

vim.keymap.set("n", "<leader>pp", vim.cmd.NvimTreeToggle)

-- Clear highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

-- Spelling
keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)

keymap("n", "<leader>s", "<cmd> setlocal spell! spelllang=en_us,de<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bd<CR>", opts)

-- Open alpha
keymap("n", "<leader>A", "<cmd> Alpha <CR>", opts)

-- keymap("n", "<leader>S", "<cmd>!bash ~/scripts/wikiscr.sh <cword> <CR>", opts)
keymap("n", "<leader>S", ":!bash ~/scripts/wikiscr.sh" .. " <C-r>\" <CR> \r", opts)

-- ToDo keybindings
keymap("n", "<leader>to", "<cmd>TodoTelescope<CR>", opts)

-- TW
keymap("n", "<leader>tw", "<cmd>TW<CR>", opts)


-- Toggle ZenMode
keymap("n", "<leader>zm", "<cmd>ZenMode<CR>", opts)

-- Trouble
-- keymap("n", "<leader>ff", "<cmd>Trouble<CR>", opts)
-- keymap("n", "<leader>fr", "<cmd>TroubleRefresh<CR>", opts)
-- keymap("n", "<leader>fc", "<cmd>TroubleClose<CR>", opts)

-- Toggle Copilot
keymap("n", "<leader>cp", "<cmd>Copilot disable<CR>", opts)

-- Markdown Preview
vim.keymap.set("n", "<leader>o", vim.cmd.MarkdownPreview, opts)

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
