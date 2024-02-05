return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.updatetime = 200

    local g = vim.g
    local fn = vim.fn
    local api = vim.api
    local cmd = api.nvim_command

    g.coc_global_extensions = {
      'coc-clangd',
      'coc-css',
      'coc-cssmodules',
      'coc-diagnostic',
      'coc-dictionary',
      'coc-docker',
      'coc-elixir',
      'coc-emmet',
      'coc-eslint',
      'coc-html',
      'coc-json',
      'coc-lua',
      'coc-phpls',
      'coc-prettier',
      'coc-pyright',
      'coc-react-refactor',
      'coc-sh',
      'coc-snippets',
      'coc-sql',
      'coc-styled-components',
      'coc-svg',
      'coc-tailwindcss',
      'coc-tslint-plugin',
      'coc-tsserver',
      'coc-vetur',
      'coc-vimlsp',
      'coc-webpack',
      'coc-word',
      'coc-xml',
      'coc-yaml',
      'coc-yank',
      'coc-lists',
    }

    function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    function _G.show_docs()
      local cw = fn.expand('<cword>')
      if fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        cmd('h ' .. cw)
      elseif api.nvim_eval('coc#rpc#ready()') then
        fn.CocActionAsync('doHover')
      else
        cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
    end

    local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false, }
    local keyset = vim.keymap.set

    -- basic configuration of suggestion and autocoxplete
    keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)

    keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

    keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], { silent = true, expr = true })

    keyset("i", "<C-space>",
      function()
        return vim.fn["coc#refresh"]()
      end,
      { silent = true, expr = true }
    )

    -- open documentation
    keyset("n", "K", [[lua _G.show_docs()<CR>]], { silent = true })

    keyset("n", "[g", "<Plug>(coc-diagnostic-prev)<CR>", { silent = true })
    keyset("n", "]g", "<Plug>(coc-diagnostic-next)<CR>", { silent = true })

    -- Goto code navigation
    keyset("n", "<leader>gd", "<Plug>(coc-definition)<CR>", { silent = true })
    keyset("n", "<leader>gt", "<Plug>(coc-type-definition)<CR>", { silent = true })
    keyset("n", "<leader>gi", "<Plug>(coc-implementation)<CR>", { silent = true })
    keyset("n", "<leader>gr", "<Plug>(coc-references)<CR>", { silent = true })

    keyset("n", "<C-f>", [[coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<Right>"]], { silent = true, nowait = true, expr = true })
    keyset("n", "<C-b>", [[coc#float#has_scroll() ? coc#float#scroll(0, -1) : "\<Right>"]], { silent = true, nowait = true, expr = true })
end,
  opt = true,
}
