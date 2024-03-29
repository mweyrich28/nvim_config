local telescope = require("telescope.builtin")

local function search_backlinks()
    local current_file = vim.fn.expand('%:t')
    -- Remove .* extension
    current_file = current_file:gsub(".md", "")
    local search_pattern = "\\[*\\]\\(.*" .. current_file

    telescope.live_grep({
        prompt_title = "Wiki Backlinks",
        default_text = search_pattern,
    })
end


return {
    search_backlinks = search_backlinks,
}

