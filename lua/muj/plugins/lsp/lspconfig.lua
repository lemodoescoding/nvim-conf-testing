return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {"antosha417/nvim-lsp-file-operations", config = true },
  },

  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
      keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
      keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definition"
			keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementation"
			keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definition"
			keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostics.open_float, opts)

			opts.desc = "Go to Previous diagnostics"
			keymap.set("n", "[d", vim.diagnostics.goto_prev, opts)

			opts.desc = "Go to Next diagnostics"
			keymap.set("n", "]d", vim.diagnostics.goto_next, opts)

			opts.desc = "Show documentation"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

    capabilities.textDocument.completion.completionItem.snippetSupport = true

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

    for _, lsp in pairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilites = capabilities,
      }
    end

    lspconfig.cssls.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }

    lspconfig.html.setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,
}
