local telescope = require("telescope.builtin")

local function search_backlinks()
    local current_file = vim.fn.expand('%:t') -- Get the current file name
    -- Remove .* extension
    current_file = current_file:gsub("%..*", "")
    local search_pattern = "\\[*\\]\\(" .. current_file -- Create a search pattern

    telescope.live_grep({
        prompt_title = "Wiki Backlinks",
        default_text = search_pattern,
    })
end


return {
    search_backlinks = search_backlinks,
}

