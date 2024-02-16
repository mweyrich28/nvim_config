local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local vimwiki_link = function()
    local opts =  require("telescope.themes").get_dropdown { prompt_title = "Vimwiki Link" }

    local current_dir = vim.fn.expand("%:p:h")
    pickers.new(opts, {
        -- get all .md files in the wiki directory using fzf
        finder = finders.new_table({
            results = vim.fn.systemlist("ls " .. current_dir .. "/*.md | awk -F/ '{print $NF}'")
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local markdown_file = selection.value
                -- split markdown_file at . and take the first part
                local wiki_link = "[" .. markdown_file:gsub("%..*", "") .. "]" .. "(" .. markdown_file .. ")"
                -- put the selected string under the cursor
                vim.api.nvim_put({ wiki_link }, "", true, true)
            end)

            return true
        end
    }):find()
end

return {
    vimwiki_link = vimwiki_link
}
