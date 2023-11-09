return {
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function() end,
  },
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      return require("astronvim.utils").extend_tbl(opts, {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end,
  },
}
