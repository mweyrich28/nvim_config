local M = {}

function M.setup()
    vim.api.nvim_set_keymap('n', '<leader>wl', [[<cmd>lua require'user.vimwiki_link'.open_wiki_links()<CR>]], { noremap = true, silent = true })
end

function M.open_wiki_links()
    local handle = io.popen('fd --type f --hidden --exclude .git --exclude "*.jpeg" --exclude "*.jpg" --exclude "*.png" --exclude "*.pdf" . ~/01_Documents/Vimwiki_md/')

	if handle == nil then
		print("Error opening wiki files")
		return
	end

    local result = handle:read("*a")
    handle:close()

    local wiki_files = vim.fn.split(result, '\n')

    if #wiki_files > 0 then
        require('cmp').setup {
            sources = {
                { name = 'buffer' },
                { name = 'path', keyword_length = 2, max_item_count = 5, opts = { all = true } }
            }
        }

        require('cmp').register_source('wiki_files', {
            name = 'wiki_files',
            keyword_pattern = '\\.\\?\\(\\S*\\)',
            get_keyword_arguments = function()
                return {
                    sources = { wiki_files }
                }
            end,
            complete = function(_, callback)
                callback(wiki_files)
            end,
        })

        vim.api.nvim_feedkeys('i', 'n', true)
        vim.api.nvim_feedkeys('i', 'n', true)
        vim.api.nvim_feedkeys('<C-X><C-U>', 'n', true)
    else
        print("No wiki files found")
    end
end

return M
