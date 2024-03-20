local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local vimwiki_link = function()
    local opts =  require("telescope.themes").get_dropdown { prompt_title = "Vimwiki Link" }

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
                -- local markdown_file = string.match(markdown_abs, "vimwiki_para/(.*)") -- get only the part after vimwiki_para/
                -- split markdown_file at . and take the first part
                local wiki_link = "[" .. string.gsub(markdown_name, ".md", "") .. "]" .. "(" .. markdown_abs .. ")"
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
