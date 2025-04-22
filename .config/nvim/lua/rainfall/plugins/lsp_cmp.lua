return {
	{
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip'
	},

	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require("cmp")
			cmp.setup({
			  snippet = {
			    expand = function(args)
			      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			    end,
			  },
			  window = {
			    -- completion = cmp.config.window.bordered(),
			    -- documentation = cmp.config.window.bordered(),
			  },
			  mapping = cmp.mapping.preset.insert({
			    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
			    ['<C-f>'] = cmp.mapping.scroll_docs(4),
			    ['<C-Space>'] = cmp.mapping.complete(),
			    -- ['<C-e>'] = cmp.mapping.abort(),
			    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			  }),
			  sources = cmp.config.sources({
			    { name = 'nvim_lsp' },
			    { name = 'vsnip' }, -- For vsnip users.
			  }, {
			    { name = 'buffer' },
			  })
			})

			cmp.setup.cmdline({ '/', '?' }, {
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
			  }),
			  matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	},

	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},

	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					"lua_ls"
				},
				automatic_installation = true

			}
			require('mason-lspconfig').setup_handlers {
				function (server_name)
					local capabilities = require('cmp_nvim_lsp').default_capabilities()
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
					}
				end

				-- You can provide configurations for each server separately
				--["rust_analyzer"] = function ()
				--	require("rust-tools").setup {}
				--end
			}
		end
	},

	{
		'neovim/nvim-lspconfig',
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
            })
        end
	},
}
