return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/cmp-path",
--     "hrsh7th/cmp-cmdline",
--     "saadparwaiz1/cmp_luasnip",
--     "L3MON4D3/LuaSnip",
--     "rafamadriz/friendly-snippets",
--     "hrsh7th/cmp-nvim-lua",
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-nvim-lsp-signature-help",
--   },
--   
--   config = function()
--     local cmp = require("cmp")
--
--     local luasnip = require("luasnip")
--
--     require("luasnip/loaders/from_vscode").lazy_load()
--
--     local kind_icons = {
--       Text = "󰉿",
--       Method = "󰆧",
--       Function = "󰊕",
--       Constructor = "",
--       Field = " ",
--       Variable = "󰀫",
--       Class = "󰠱",
--       Interface = "",
--       Module = "",
--       Property = "󰜢",
--       Unit = "󰑭",
--       Value = "󰎠",
--       Enum = "",
--       Keyword = "󰌋",
--       Snippet = "",
--       Color = "󰏘",
--       File = "󰈙",
--       Reference = "",
--       Folder = "󰉋",
--       EnumMember = "",
--       Constant = "󰏿",
--       Struct = "",
--       Event = "",
--       Operator = "󰆕",
--       TypeParameter = " ",
--       Misc = " ",
--     }
--
--     local check_backspace = function()
--       local col = vim.fn.col "." - 1
--       return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--     end
--
--     cmp.setup({
--       snippets = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--         ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--         ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--
--         ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--               cmp.select_next_item()
--             elseif luasnip.expandable() then
--               luasnip.expand()
--             elseif luasnip.expand_or_jumpable() then
--               luasnip.expand_or_jump()
--             elseif check_backspace() then
--               fallback()
--             else
--               fallback()
--             end
--           end, {
--                 "i", "s",
--               }),
--         ["<S-Tab>"] = cmp.mapping(function(callback)
--             if cmp.visible() then
--               cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--               luasnip.jump(-1)
--             else
--               fallback()
--             end
--           end, {
--                 "i", "s",
--               }),
--       }),
--
--       formatting = {
--         fields = { "kind", "abbr", "menu" },
--         format = function(entry, vim_item)
--           vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--
--           vim_item.menu = ({
--             nvim_lsp = "[L]",
--             nvim_lua = "[L]",
--             luasnip = "[S]",
--             buffer = "[B]",
--             path = "[P]",
--           })[entry.source.name]
--
--           return vim_item
--         end,
--       },
--
--       sources = {
--         -- { name = "nvim_lsp_signature_help" },
--         { name = "nvim_lsp" },
--         -- { name = "nvim_lua"},
--         { name = "luasnip" },
--         { name = "buffer" },
--         { name = "path" },
--       },
--       confirm_opts = {
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = false,
--       },
--       window = {
--           documentation = {
--           border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--         },
--       },
--     })
--   end,
}
