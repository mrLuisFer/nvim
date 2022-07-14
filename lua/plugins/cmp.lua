  local cmp = require'cmp'
	local lspkind = require'lspkind'

  cmp.setup({
		snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<C-e>'] = cmp.mapping.abort(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
			{ name = 'luasnip' }
    }, {
      { name = 'buffer' },
    }),
		formatting = {
			format = lspkind.cpm_format,
			mode = 'symbol',
			-- maxWidth = "55px"
		}
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['cssmodules_ls'].setup {
    capabilities = capabilities
}
require('lspconfig')['eslint'].setup {
    capabilities = capabilities
}
require('lspconfig')['html'].setup {
    capabilities = capabilities
}
require('lspconfig')['prismals'].setup {
    capabilities = capabilities
}
require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
}
require('lspconfig')['svelte'].setup {
    capabilities = capabilities
}
require('lspconfig')['tailwindcss'].setup {
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}
require('lspconfig')['vimls'].setup {
    capabilities = capabilities
}
require('lspconfig')['vuels'].setup {
    capabilities = capabilities
}
require('lspconfig')['emmet_ls'].setup {
    capabilities = capabilities
}
require('lspconfig')['quick_lint_js'].setup {
    capabilities = capabilities
}
require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities,
    settings = {
      Lua = {
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = 2,
            end_of_line = "lf",
          }
        },
        diagnostics = {
          enable = true,
          globals = {'vim'}
        }
      }
    }
  }
