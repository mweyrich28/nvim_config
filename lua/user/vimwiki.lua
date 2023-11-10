
vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_conceal_pre = 1
vim.g.vimwiki_auto_chdir= 1
vim.g.vimwiki_listing_hl = 1
vim.opt.showtabline = 1                         -- don't show tabs

vim.g.vimwiki_list = {
	{
		path = '~/01_Documents/Vimwiki_md/',
		-- path = '/home/malte/01_Documents/vimwiki',
		syntax = 'markdown',
		ext = '.md'
	}
}
