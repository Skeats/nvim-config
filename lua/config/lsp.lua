local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
	virtual_text  = true,
	severity_sort = true,
	float         = {
		style  = 'minimal',
		border = 'rounded',
		source = 'if_many',
		header = '',
		prefix = '',
	},
	signs         = {
		text = {
			[vim.diagnostic.severity.ERROR] = '✘',
			[vim.diagnostic.severity.WARN]  = '▲',
			[vim.diagnostic.severity.HINT]  = '⚑',
			[vim.diagnostic.severity.INFO]  = '»',
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local buf    = args.buf
		local map    = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = buf }) end

		map('n', 'K', vim.lsp.buf.hover)
		map('n', 'gd', vim.lsp.buf.definition)
		map('n', 'gD', vim.lsp.buf.declaration)
		map('n', 'gi', vim.lsp.buf.implementation)
		map('n', 'go', vim.lsp.buf.type_definition)
		map('n', 'gr', vim.lsp.buf.references)
		map('n', 'gs', vim.lsp.buf.signature_help)
		map('n', 'gl', vim.diagnostic.open_float)
		map('n', '<F2>', vim.lsp.buf.rename)
		map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end)
		map('n', '<F4>', vim.lsp.buf.code_action)

		-- Automatic inlay hints
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = buf })
		end

		-- Code completion
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, buf, {})
		end

		-- Document highlighting
		if client:supports_method('textDocument/documentHighlight') then
			local highlight_augroup = vim.api.nvim_create_augroup('my.lsp.highlight', { clear = false })
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
		end

		-- Formatting
		local excluded_filetypes = { php = true, c = true, cpp = true }
		if not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting')
			and not excluded_filetypes[vim.bo[buf].filetype]
		then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
				buffer = buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

-- Lua LSP config
vim.lsp.config['luals'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	capabilities = caps,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				checkThirdParty = false,
				library = vim.list_extend(
					vim.api.nvim_get_runtime_file('', true),
					{ '/home/tony/repos/oxwm/templates' }
				),
			},
			telemetry = { enable = false },
		},
	},
}

vim.lsp.config('rust_analyzer', {
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			imports = {
				granularity = {
					group = "module",
				},
			},
			inlayHints = {
				typeHints = {
					enable = true
				},
				parameterHints = {
					enable = true,
				},
				closingBraceHints = {
					enable = true
				},
				chainingHints = {
					enable = true
				},
				bindingModeHints = {
					enable = true
				},
				lifetimeElisionHints = {
					enable = "always",
				},
			},
			cargo = {
				allFeatures = true,
				buildScripts = {
					enable = true,
				},
				procMacro = {
					enable = true,
				},
			},
			checkOnSave = {
				enable = true,
				command = "clippy  -- -W clippy:pedantic"
			},
			check = {
				allTargets = true,
			},
		}
	}
})
