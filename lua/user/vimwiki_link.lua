local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

function split(str)
    local parts = {}
    for part in string.gmatch(str, "/") do
        table.insert(parts, part)
    end
    return parts
end

local vimwiki_link = function()
    local opts = require("telescope.themes").get_dropdown { prompt_title = "Vimwiki Link" }

    local results = vim.fn.systemlist("find /home/malte/documents/vimwiki_para -type f -name '*.md'")
    local processed_results = {}
    for _, path in ipairs(results) do
        local markdown_file = string.match(path, ".*/vimwiki_para/(.*)")
        if markdown_file then
            table.insert(processed_results, markdown_file)
        end
    end

    pickers.new(opts, {
        finder = finders.new_table({
            results = processed_results
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local markdown_abs = selection.value
                local markdown_name = markdown_abs.match(markdown_abs, "[^/]+$")

                local current_file_path = vim.fn.expand("%:p")
                local current_file_dir = current_file_path:match("(.*/)") 

                local root_depth = 5 -- this should be the 'depth' of your main vimwiki folder 
                local current_file_path_table = split(current_file_path)
                local relative_path = ""

                local curr_depht = 0
                for i, part in ipairs(current_file_path_table) do
                    curr_depht = curr_depht + 1
                end

                -- Count the number of directories to go up
                local current_dir_level = current_file_dir:gsub("[^/]*", "")
                for i=1, curr_depht - root_depth,1 do
                    relative_path = relative_path .. "../"
                end

                -- Append the path to the markdown file
                relative_path = relative_path .. markdown_abs
                local wiki_link = "[" .. markdown_name .. "]" .. "(" .. relative_path .. ")"
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
