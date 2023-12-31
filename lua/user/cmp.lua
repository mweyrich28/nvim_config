local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--     return
-- end

-- require("luasnip/loaders/from_vscode").lazy_load()
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
require("cmp_nvim_ultisnips").setup{}

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = " ",
	Misc = " "
	,}


cmp.setup({
    snippet = {
        --expand = function(args)
        --    luasnip.lsp_expand(args.body) -- For `luasnip` users.
        --end,
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
    },

    mapping = {
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      },

    -- mapping = cmp.mapping.preset.insert({
    --     ["<C-k>"] = cmp.mapping.select_prev_item(),
    --     ["<C-j>"] = cmp.mapping.select_next_item(),
    --     ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    --     ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    --     -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    --     ["<C-Space>"] = cmp.mapping.abort(),
    --     -- ["<C-e>"] = cmp.mapping({
    --         -- 	i = cmp.mapping.abort(),
    --         -- 	c = cmp.mapping.close(),
    --         -- }),
    --         -- Accept currently selected item. If none selected, `select` first item.
    --         -- Set `select` to `false` to only confirm explicitly selected items.
    --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --         ["<Tab>"] = cmp.mapping(function(fallback)
    --             if cmp.visible() then
    --                 cmp.select_next_item()
    --             elseif luasnip.expandable() then
    --                 luasnip.expand()
    --             elseif luasnip.expand_or_jumpable() then
    --                 luasnip.expand_or_jump()
    --             elseif check_backspace() then
    --                 fallback()
    --             else
    --                 fallback()
    --             end
    --         end, {
    --         "i",
    --         "s",
    --     }),
    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_prev_item()
    --         elseif luasnip.jumpable(-1) then
    --             luasnip.jump(-1)
    --         else
    --             fallback()
    --         end
    --     end, {
    --     "i",
    --     "s",
   --   }),
-- }),

formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]
        vim_item.menu = ({
        ultisnips = "[Snippet]",
        buffer = "[Buffer]",
		nvim_lsp = "[LSP]",
		cmdline = "[Cmd]",
        path = "[Path]",
		nvim_lua = "[Lua]",
        })[entry.source.name]
        return vim_item
    end,
},
sources = {
    { name = "nvim_lsp" },
    { name = "ultisnips" },
	{ name = "nvim_lua" },
    { name = "path" },
    { name = "buffer" },
},
confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
},
window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
},
experimental = {
    ghost_text = false,
},
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
