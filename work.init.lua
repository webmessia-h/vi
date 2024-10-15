-- Ignore the user lua configuration
vim.opt.runtimepath:remove(vim.fn.stdpath("config")) -- ~/.config/nvim
vim.opt.runtimepath:remove(vim.fn.stdpath("config") .. "/after") -- ~/.config/nvim/after

-- Nixvim's internal module table
-- Can be used to share code throughout init.lua
local _M = {}

-- Set up globals {{{
do
	local nixvim_globals = { mapleader = " ", undotree_autoOpenDiff = true, undotree_focusOnToggle = true }

	for k, v in pairs(nixvim_globals) do
		vim.g[k] = v
	end
end
-- }}}

-- Set up options {{{
do
	local nixvim_options = {
		backup = false,
		breakindent = true,
		clipboard = { providers = { ["wl-copy"] = { enable = true } } },
		cmdheight = 0,
		completeopt = { "menuone", "noselect", "noinsert" },
		cursorline = true,
		encoding = "utf-8",
		expandtab = true,
		fileencoding = "utf-8",
		foldcolumn = "0",
		foldenable = true,
		foldexpr = "nvim_treesitter#foldexpr()",
		foldlevel = 99,
		foldlevelstart = 99,
		foldmethod = "expr",
		grepformat = "%f:%l:%c:%m",
		grepprg = "rg --vimgrep",
		hlsearch = true,
		ignorecase = true,
		incsearch = true,
		mouse = "a",
		number = true,
		relativenumber = true,
		scrolloff = 8,
		shiftwidth = 2,
		showmode = false,
		showtabline = 2,
		smartcase = true,
		smartindent = true,
		softtabstop = 2,
		splitbelow = true,
		splitright = true,
		swapfile = false,
		tabstop = 2,
		termguicolors = true,
		timeoutlen = 10,
		undofile = true,
		updatetime = 50,
		wrap = true,
	}

	for k, v in pairs(nixvim_options) do
		vim.opt[k] = v
	end
end
-- }}}

do
	local base16 = require("base16-colorscheme")
	base16.with_config({
		cmp = true,
		illuminate = true,
		indentblankline = true,
		lsp_semantic = true,
		mini_completion = true,
		telescope = true,
		telescope_borders = false,
	})
	base16.setup({
		base00 = "#151515",
		base01 = "#1F1F1F",
		base02 = "#2E2E2E",
		base03 = "#424242",
		base04 = "#BBB6B6",
		base05 = "#E8E3E3",
		base06 = "#E8E3E3",
		base07 = "#E8E3E3",
		base08 = "#B66467",
		base09 = "#D9BC8C",
		base0A = "#D9BC8C",
		base0B = "#8C977D",
		base0C = "#8AA6A2",
		base0D = "#8DA3B9",
		base0E = "#A988B0",
		base0F = "#BBB6B6",
	})
end

-- Highlight groups {{
do
	local highlights = {
		AlphaHeader = { bg = "none", fg = "#A988B0" },
		CmpItemAbbr = { bg = "none", fg = "#424242" },
		CmpItemAbbrMatch = { bg = "none", fg = "#E8E3E3" },
		CmpItemAbbrMatchFuzzy = { bg = "none", fg = "#E8E3E3" },
		CmpItemKind = { bg = "none", fg = "#A988B0" },
		CmpItemKindSnippet = { bg = "none", fg = "#A988B0" },
		CmpItemMenu = { bg = "none", fg = "#A988B0" },
		CursorLine = { bg = "none", fg = "none" },
		CursorLineNr = { bg = "none", fg = "none" },
		FloatBorder = { bg = "#1F1F1F", fg = "#1F1F1F" },
		LineNr = { bg = "none", fg = "#424242" },
		NoiceCmdlinePopup = { bg = "#1F1F1F", fg = "#BBB6B6" },
		NoiceCmdlinePopupBorder = { bg = "#1F1F1F", fg = "#1F1F1F" },
		NoiceCmdlinePopupBorderSearch = { bg = "#1F1F1F", fg = "#1F1F1F" },
		NormalFloat = { bg = "#1F1F1F", fg = "none" },
		Pmenu = { bg = "#1F1F1F", fg = "none" },
		PmenuSbar = { bg = "#1F1F1F", fg = "none" },
		PmenuSel = { bg = "#2E2E2E", fg = "none" },
		PmenuThumb = { bg = "#1F1F1F", fg = "none" },
		StatusNormal = { bg = "none", fg = "none" },
		TSAttribute = { fg = "#8DA3B9" },
		TSBoolean = { fg = "#8DA3B9" },
		TSCharacter = { fg = "#8DA3B9" },
		TSComment = { fg = "#2E2E2E", italic = true },
		TSConditional = { fg = "#B66467" },
		TSConstBuiltin = { fg = "#8DA3B9" },
		TSConstMacro = { fg = "#D9BC8C" },
		TSConstant = { fg = "#8DA3B9" },
		TSConstructor = { fg = "#8DA3B9" },
		TSDanger = { fg = "#424242" },
		TSEmphasis = { fg = "#E8E3E3", italic = true },
		TSEnvironmentName = { fg = "#D9BC8C" },
		TSEnvirontment = { fg = "#A988B0" },
		TSException = { fg = "#424242" },
		TSField = { fg = "#B66467" },
		TSFloat = { fg = "#424242" },
		TSFuncBuiltin = { fg = "#8AA6A2" },
		TSFuncMacro = { fg = "#8C977D" },
		TSFunction = { fg = "#B66467" },
		TSInclude = { fg = "#B66467" },
		TSKeyword = { fg = "#A988B0" },
		TSKeywordFunction = { fg = "#8DA3B9" },
		TSKeywordReturn = { fg = "#8DA3B9" },
		TSLabel = { fg = "#8DA3B9" },
		TSLiteral = { fg = "#8C977D" },
		TSMath = { fg = "#8DA3B9" },
		TSMethod = { fg = "#8DA3B9" },
		TSNamespace = { fg = "#B66467" },
		TSNote = { fg = "#424242" },
		TSNumber = { fg = "#D9BC8C" },
		TSParameter = { fg = "#B66467" },
		TSParameterReference = { fg = "#B66467" },
		TSProperty = { fg = "#B66467" },
		TSPunctBracket = { fg = "#E8E3E3" },
		TSPunctDelimiter = { fg = "#E8E3E3" },
		TSPunctSpecial = { fg = "#E8E3E3" },
		TSRepeat = { fg = "#D9BC8C" },
		TSStrike = { fg = "#E8E3E3" },
		TSString = { fg = "#8C977D" },
		TSStringEscape = { fg = "#8DA3B9" },
		TSStringRegex = { fg = "#8C977D" },
		TSStringSpecial = { fg = "#8DA3B9" },
		TSStrong = { fg = "#E8E3E3" },
		TSSymbol = { fg = "#B66467" },
		TSTag = { fg = "#8DA3B9" },
		TSTagAttribute = { fg = "#B66467" },
		TSTagDelimiter = { fg = "#E8E3E3" },
		TSText = { fg = "#E8E3E3" },
		TSTextReference = { fg = "#8DA3B9" },
		TSTitle = { fg = "#D9BC8C" },
		TSType = { fg = "#D9BC8C" },
		TSTypeBuiltin = { fg = "#D9BC8C" },
		TSURI = { fg = "#D9BC8C" },
		TSUnderline = { fg = "#A988B0" },
		TSVariable = { fg = "#E8E3E3" },
		TSVariableBuiltin = { fg = "#8DA3B9" },
		TSWarning = { bg = "#B66467", fg = "#151515" },
		TelescopePromptBorder = { bg = "#1F1F1F", fg = "#1F1F1F" },
		TelescopePromptNormal = { bg = "#1F1F1F", fg = "none" },
		TelescopePromptPrefix = { bg = "#1F1F1F", fg = "#B66467" },
		TelescopeSelection = { bg = "#1F1F1F", fg = "none" },
		TsKeywordOperator = { fg = "#8DA3B9" },
		VertSplit = { bg = "none", fg = "#1F1F1F" },
	}

	for k, v in pairs(highlights) do
		vim.api.nvim_set_hl(0, k, v)
	end
end
-- }}

vim.diagnostic.config({
	float = { border = "rounded" },
	jump = { severity = vim.diagnostic.severity.WARN },
	severity_sort = true,
	update_in_insert = true,
})

require("null-ls").setup({
	on_attach = require("lsp-format").on_attach,
	sources = {
		require("null-ls").builtins.code_actions.statix,
		require("null-ls").builtins.diagnostics.checkmake,
		require("null-ls").builtins.diagnostics.cppcheck.with({
			disabled_filetypes = { "h", "hpp" },
			extra_args = {
				"--enable=warning,style,performance,portability",
				"--check-level=exhaustive",
				"--template=gcc",
				"--std=c17",
				"--inline-suppr",
				"--suppress=missingInclude",
				"--suppress=checkersReport",
			},
			rootPatterns = { ".git", "compile_commands.json" },
		}),
		require("null-ls").builtins.diagnostics.statix,
		require("null-ls").builtins.formatting.clang_format,
		require("null-ls").builtins.formatting.nixfmt,
		require("null-ls").builtins.formatting.stylua,
	},
	updateInInsert = false,
})

local cmp = require("cmp")
cmp.setup({
	autoEnableSources = true,
	experimental = { ghost_text = true },
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = require("lspkind").cmp_format({ ellipsis_char = "...", maxwidth = 50 }),
	},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
	},
	performance = { debounce = 60, fetchingTimeout = 200, maxViewEntries = 30 },
	snippet = { expand = luasnip },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "emoji" },
		{ keywordLength = 3, name = "buffer", option = { get_bufnrs = vim.api.nvim_list_bufs } },
		{ keywordLength = 3, name = "path" },
		{ keywordLength = 3, name = "luasnip" },
	},
	window = { completion = { border = "solid" }, documentation = { border = "solid" } },
})

require("which-key").setup({ spec = { { "<leader>x", group = "trouble", mode = "n" } } })

require("nvim-web-devicons").setup({ color_icons = false, strict = true })

require("trouble").setup({
	modes = {
		preview_float = {
			mode = "diagnostics",
			preview = {
				border = "rounded",
				position = { 0, -2 },
				relative = "editor",
				size = { height = 0.3, width = 0.3 },
				title = "Preview",
				title_pos = "center",
				type = "float",
				zindex = 200,
			},
		},
		preview_split = {
			mode = "diagnostics",
			preview = { position = "right", relative = "win", size = 0.5, type = "split" },
		},
	},
})

require("treesitter-context").setup({})

vim.opt.runtimepath:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "site"))
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
	parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
	textobjects = {
		move = {
			enable = true,
			goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
			goto_next_start = { ["]]"] = "@class.outer", ["]m"] = "@function.outer" },
			goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
			goto_previous_start = { ["[["] = "@class.outer", ["[m"] = "@function.outer" },
		},
		select = {
			enable = true,
			keymaps = {
				aa = "@parameter.outer",
				ac = "@class.outer",
				af = "@function.outer",
				ai = "@conditional.outer",
				al = "@loop.outer",
				at = "@comment.outer",
				ia = "@parameter.inner",
				ic = "@class.inner",
				["if"] = "@function.inner",
				ii = "@conditional.inner",
				il = "@loop.inner",
			},
			lookahead = true,
		},
		swap = {
			enable = true,
			swap_next = { ["<leader>a"] = "@parameters.inner" },
			swap_previous = { ["<leader>A"] = "@parameter.outer" },
		},
	},
})
do
	local __parserFiletypeMappings = { liq = { "liquidsoap" } }

	for parser_name, ft in pairs(__parserFiletypeMappings) do
		require("vim.treesitter.language").register(parser_name, ft)
	end
end

require("telescope").setup({
	defaults = { layout_config = { horizontal = { prompt_position = "top" } }, sorting_strategy = "ascending" },
	extensions = { frecency = { disable_devicons = true } },
})

local __telescopeExtensions = { "ui-select", "fzf", "frecency", "file_browser" }
for i, extension in ipairs(__telescopeExtensions) do
	require("telescope").load_extension(extension)
end

require("smart-splits").setup({})

require("oil").setup({
	deleteToTrash = true,
	float = { border = "rounded", maxHeight = 0, maxWidth = 0, padding = 2, winOptions = { winblend = 0 } },
	keymaps = {
		["-"] = "actions.parent",
		["<C-\\>"] = "actions.select_vsplit",
		["<C-c>"] = "actions.close",
		["<C-enter>"] = "actions.select_split",
		["<C-r>"] = "actions.refresh",
		["<C-t>"] = "actions.select_tab",
		["<C-v>"] = "actions.preview",
		["<CR>"] = "actions.select",
		_ = "actions.open_cwd",
		["`"] = "actions.cd",
		["g."] = "actions.toggle_hidden",
		["g?"] = "actions.show_help",
		gs = "actions.change_sort",
		gx = "actions.open_external",
		q = "actions.close",
		["~"] = "actions.tcd",
	},
	preview = { border = "rounded" },
	useDefaultKeymaps = true,
})

require("nvim-autopairs").setup({})

require("mini.ai").setup({})

require("mini.animate").setup({})

require("mini.hipatterns").setup({
	highlighters = { hex_color = require("mini.hipatterns").gen_highlighter.hex_color() },
})

require("mini.surround").setup({})

require("lualine").setup({
	inactive_sections = { lualine_x = { "filename", "filetype" } },
	options = {
		disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
		globalstatus = true,
		theme = {
			normal = {
				a = { bg = "#nil" },
				b = { bg = "nil" },
				c = { bg = "nil" },
				y = { bg = "nil" },
				z = { bg = "nil" },
			},
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				color = { bg = "nil", fg = "#BBB6B6" },
				fmt = string.lower,
				separator = { left = "", right = "" },
			},
		},
		lualine_b = {
			{
				"branch",
				color = { bg = "nil", fg = "#BBB6B6" },
				icon = { "" },
				separator = { left = "", right = "" },
			},
			{ "diff", separator = { left = "", right = "" } },
		},
		lualine_c = {
			{
				"diagnostic",
				color = { bg = "nil", fg = "#B66467" },
				separator = { left = "", right = "" },
				symbols = { error = " ", hint = "󰝶 ", info = " ", warn = " " },
			},
			"diagnostics",
			{
				opts = function(_, opts)
					local trouble = require("trouble")
					local symbols = trouble.statusline({
						mode = "lsp_document_symbols",
						groups = {},
						title = false,
						filter = { range = true },
						format = "{kind_icon}{symbol.name:Normal}",
						hl_group = "lualine_c_normal",
					})
					table.insert(opts.sections.lualine_c, {
						symbols.get,
						cond = symbols.has,
					})
				end,
			},
		},
		lualine_x = { "" },
		lualine_y = {
			{ "filetype", colored = true, icon_only = true, separator = { left = "", right = "" } },
			{
				"filename",
				color = { bg = "nil", fg = "#E8E3E3" },
				separator = { left = "", right = "" },
				symbols = { modified = "", readonly = "👁️", unnamed = "" },
			},
		},
		lualine_z = { { "location", color = { bg = "nil", fg = "#8C977D" }, separator = { left = "", right = "" } } },
	},
})

require("hardtime").setup({
	disable_mouse = true,
	disabled_filetypes = { "Oil" },
	enabled = true,
	hint = true,
	max_count = 4,
	max_time = 1000,
	restricted_keys = {
		["+"] = { "n", "x" },
		["-"] = { "n", "x" },
		["<C-M>"] = { "n", "x" },
		["<C-N>"] = { "n", "x" },
		["<C-P>"] = { "n", "x" },
		["<CR>"] = { "n", "x" },
		gj = { "n", "x" },
		gk = { "n", "x" },
		h = { "n", "x" },
		j = { "n", "x" },
		k = { "n", "x" },
		l = { "n", "x" },
	},
	restriction_mode = "hint",
})

require("gitblame").setup({
	date_format = "%r",
	delay = 200,
	display_virtual_text = true,
	highlight_group = "Comment",
	message_template = "<summary> • <date> • <author>",
	message_when_not_committed = "Oh please, commit this !",
	set_extmark_options = { priority = 7 },
	use_blame_commit_file_urls = false,
	virtual_text_column = 80,
})

require("flash").setup({
	jump = { autojump = true },
	label = { rainbow = { enabled = false, shade = 5 }, uppercase = false },
	labels = "asdfghjklqwertyuiopzxcvbnm",
	search = { mode = "fuzzy" },
})

require("dressing").setup({ input = { relative = "win" }, select = { backend = { "telescope" } } })

require("conform").setup({
	format_on_save = { lspFallback = true, timeoutMs = 500 },
	formatters_by_ft = {
		asm = { "asmfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		liquidsoap = { "liquidsoap-prettier" },
		lua = { "stylua" },
		markdown = { { "prettierd", "prettier" } },
		nix = { "nixfmt" },
		python = { "black" },
	},
	notify_on_error = true,
})

require("Comment").setup({})

require("bufferline").setup({
	highlights = {
		background = { bg = "#1F1F1F", fg = "#424242" },
		buffer_selected = { fg = "#E8E3E3", italic = false },
		buffer_visible = { bg = "#151515", fg = "#424242" },
		close_button = { bg = "#1F1F1F", fg = "#424242" },
		close_button_selected = { fg = "#B66467" },
		close_button_visible = { bg = "#1F1F1F", fg = "#424242" },
		duplicate = { bg = "#1F1F1F", fg = "#424242" },
		fill = { bg = "none", fg = "none" },
		indicator_selected = { fg = "#151515" },
		indicator_visible = { bg = "#151515", fg = "#151515" },
		modified = { bg = "#151515", fg = "#424242" },
		modified_selected = { fg = "#8C977D" },
		modified_visible = { bg = "#151515", fg = "#151515" },
		separator = { bg = "#1F1F1F", fg = "#1F1F1F" },
		tab_close = { bg = "#151515", fg = "#151515" },
	},
	options = { separator_style = "thin" },
})

-- LSP {{{
do
	local __clangdCaps = vim.lsp.protocol.make_client_capabilities()
	__clangdCaps.offsetEncoding = { "utf-16" }

	local __lspServers = {
		{ name = "nil_ls" },
		{
			extraOptions = {
				capabilities = __clangdCaps,
				cmd = {
					"clangd",
					"--clang-tidy",
					"--clang-tidy-checks=*",
					"--all-scopes-completion",
					"--cross-file-rename",
					"--completion-style=detailed",
					"--header-insertion-decorators",
					"--header-insertion=iwyu",
					"--pch-storage=memory",
				},
			},
			name = "clangd",
		},
	}
	-- Adding lspOnAttach function to nixvim module lua table so other plugins can hook into it.
	_M.lspOnAttach = function(client, bufnr)
		require("lsp-format").on_attach(client)
	end
	local __lspCapabilities = function()
		capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		return capabilities
	end

	local __setup = {
		on_attach = _M.lspOnAttach,
		capabilities = __lspCapabilities(),
	}

	for i, server in ipairs(__lspServers) do
		if type(server) == "string" then
			require("lspconfig")[server].setup(__setup)
		else
			local options = server.extraOptions

			if options == nil then
				options = __setup
			else
				options = vim.tbl_extend("keep", options, __setup)
			end

			require("lspconfig")[server.name].setup(options)
		end
	end

	require("clangd_extensions").setup({
		ast = {
			kind_icons = {
				Compound = "",
				PackExpansion = "",
				Recovery = "",
				TemplateParamObject = "",
				TemplateTemplateParm = "",
				TemplateTypeParm = "",
				TranslationUnit = "",
			},
			role_icons = {
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
				type = "",
			},
		},
		inlay_hints = { highlight = "comment" },
	})
end
-- }}}

require("ufo").setup({})

require("colorizer").setup({
	filetypes = nil,
	user_default_options = nil,
	buftypes = nil,
})

vim.notify = require("notify")
require("notify").setup({ background_colour = "#000000", fps = 60, render = "default", timeout = 1000, top_down = true })

require("noice").setup({
	format = {
		filter = {
			icon = "",
			lang = "regex",
			pattern = { ":%s*%%s*s:%s*", ":%s*%%s*s!%s*", ":%s*%%s*s/%s*", "%s*s:%s*", ":%s*s!%s*", ":%s*s/%s*" },
		},
		replace = {
			icon = "󱞪",
			lang = "regex",
			pattern = {
				":%s*%%s*s:%w*:%s*",
				":%s*%%s*s!%w*!%s*",
				":%s*%%s*s/%w*/%s*",
				"%s*s:%w*:%s*",
				":%s*s!%w*!%s*",
				":%s*s/%w*/%s*",
			},
		},
	},
	lsp = { message = { enabled = true }, progress = { enabled = false, view = "mini" } },
	messages = { enabled = true },
	notify = { enabled = false },
	popupmenu = { backend = "nui", enabled = true },
})

require("neo-tree").setup({ document_symbols = { custom_kinds = {} } })

require("luasnip").config.setup({ enable_autosnippets = true, store_selection_keys = "<Tab>" })

require("luasnip.loaders.from_vscode").lazy_load({
	paths = "/nix/store/v4jrl29bypmpsm21las0cd7jz1xijmww-vimplugin-friendly-snippets-2024-09-23",
})

require("lspsaga").setup({
	beacon = { enable = true },
	code_action = {
		extend_gitsigns = false,
		keys = { exec = "<CR>", quit = { "<Esc>", "q" } },
		num_shortcut = true,
		only_in_cursor = true,
		show_server_name = true,
	},
	diagnostic = {
		border_follow = true,
		diagnostic_only_current = false,
		extend_relatedInformation = true,
		show_code_action = true,
	},
	hover = { open_cmd = "!firefox", open_link = "gx" },
	implement = { enable = false },
	lightbulb = { enable = false, sign = false, virtual_text = true },
	outline = {
		auto_close = true,
		auto_preview = true,
		close_after_jump = true,
		keys = { jump = "e", quit = "q", toggle_or_jump = "o" },
		layout = "normal",
		win_position = "right",
	},
	rename = { auto_save = false, keys = { exec = "<CR>", quit = { "<C-k>", "<Esc>" }, select = "x" } },
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	symbol_in_winbar = { enable = true },
	ui = { border = "solid", devicon = true },
})

require("lsp-format").setup({})

require("illuminate").configure({
	filetypes_denylist = { "Outline", "TelescopePrompt", "alpha", "harpoon", "reason" },
	under_cursor = false,
})

require("gitlinker").setup({
	callbacks = {
		["github.com"] = require("gitlinker.hosts").get_github_type_url,
		["gitlab.dnm.radiofrance.fr"] = require("gitlinker.hosts").get_github_type_url,
	},
})

require("git-worktree").setup({ enabled = true })
require("telescope").load_extension("git_worktree")

require("fidget").setup({
	logger = { float_precision = 0.01, level = vim.log.levels.WARN },
	notification = {
		configs = { default = require("fidget.notification").default_config },
		filter = vim.log.levels.INFO,
		history_size = 128,
		override_vim_notify = true,
		poll_rate = 10,
		redirect = function(msg, level, opts)
			if opts and opts.on_open then
				return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
			end
		end,
		view = { group_separator = "---", group_separator_hl = "Comment", icon_separator = " ", stack_upwards = true },
		window = {
			align = "bottom",
			border = "none",
			max_height = 0,
			max_width = 0,
			normal_hl = "Comment",
			relative = "editor",
			winblend = 0,
			x_padding = 1,
			y_padding = 0,
			zindex = 45,
		},
	},
	progress = {
		clear_on_detach = function(client_id)
			local client = vim.lsp.get_client_by_id(client_id)
			return client and client.name or nil
		end,
		display = {
			done_icon = "✓",
			done_style = "Constant",
			done_ttl = 3,
			format_annote = function(msg)
				return msg.title
			end,
			format_group_name = function(group)
				return tostring(group)
			end,
			format_message = require("fidget.progress.display").default_format_message,
			group_style = "Title",
			icon_style = "Question",
			overrides = { rust_analyzer = { name = "rust-analyzer" } },
			priority = 30,
			progress_icon = { pattern = "dots", period = 1 },
			progress_style = "WarningMsg",
			progress_ttl = math.huge,
			render_limit = 16,
			skip_history = true,
		},
		ignore_done_already = false,
		ignore_empty_message = false,
		lsp = { progress_ringbuf_size = 0 },
		notification_group = function(msg)
			return msg.lsp_client.name
		end,
		poll_rate = 0,
		suppress_on_insert = true,
	},
})

require("alpha").setup({
	layout = {
		{ type = "padding", val = 4 },
		{
			opts = { hl = "AlphaHeader", position = "center" },
			type = "text",
			val = {
				" •┏           ┓ •             ┓      ┓        ┓                  ",
				" ┓╋  ┏┏┓┏┳┓┏┓╋┣┓┓┏┓┏┓  ┏┏┓┏┓  ┣┓┏┓  ┏┫┏┓┏┓┏┓  ┣┓┓┏  ┏┓  ┏┳┓┏┓┏┓  ",
				" ┗┛  ┛┗┛┛┗┗┗ ┗┛┗┗┛┗┗┫  ┗┗┻┛┗  ┗┛┗   ┗┻┗┛┛┗┗   ┗┛┗┫  ┗┻  ┛┗┗┗┻┛┗╻ ",
				"       • ┓      •   ┛    ┓        • ┓ •          ┛          ┓    ",
				" ┏┏┓┏┓┏┓┏┫┏┓┏┓  ┓╋  ╋┏┓  ┣┓┏┓  ┓┏┏┓╋┣┓┓┏┓  ┓┏┏┓┓┏┏┓  ┏┓┏┓┏┓┏┣┓   ",
				" ┗┗┛┛┗┛┗┗┻┗ ┛   ┗┗  ┗┗┛  ┗┛┗   ┗┻┛┗┗┛┗┗┛┗  ┗┫┗┛┗┻┛   ┛ ┗ ┗┻┗┛┗   ",
				"                                            ┛                    ",
				"\t\t\t\t\t\t\t \t                                                  ",
				"\t\t\t\t\t\t\t\t                                                  ",
				"\t\t\t\t\t\t\t\t                                                  ",
			},
		},
		{ type = "padding", val = 2 },
		{
			type = "group",
			val = {
				{
					opts = {
						align_shortcut = "right",
						cursor = 0,
						hl = "Operator",
						hl_shortcut = "Keyword",
						keymap = {
							"n",
							"f",
							"<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>",
							{},
						},
						position = "center",
						shortcut = "f",
						width = 40,
					},
					type = "button",
					val = "Find File",
				},
				{
					opts = {
						align_shortcut = "right",
						cursor = 0,
						hl = "Operator",
						hl_shortcut = "Keyword",
						keymap = { "n", "n", "<CMD>ObsidianToday<CR>", {} },
						position = "center",
						shortcut = "n",
						width = 40,
					},
					type = "button",
					val = "Note",
				},
				{
					opts = {
						align_shortcut = "right",
						cursor = 0,
						hl = "String",
						hl_shortcut = "Keyword",
						keymap = { "n", "q", "<CMD>qa<CR>", {} },
						position = "center",
						shortcut = "q",
						width = 40,
					},
					type = "button",
					val = "Quit",
				},
			},
		},
		{ type = "padding", val = 2 },
	},
})
require("alpha.term")

-- Set up keybinds {{{
do
	local __nixvim_binds = {
		{
			action = "<cmd>Telescope git_files<cr>",
			key = "<C-p>",
			mode = "n",
			options = { desc = "Search git files" },
		},
		{
			action = "<cmd>Telescope live_grep<cr>",
			key = "<leader>/",
			mode = "n",
			options = { desc = "Grep (root dir)" },
		},
		{
			action = "<cmd>Telescope command_history<cr>",
			key = "<leader>:",
			mode = "n",
			options = { desc = "Command History" },
		},
		{
			action = "<cmd>Telescope find_files<cr>",
			key = "<leader><space>",
			mode = "n",
			options = { desc = "Find project files" },
		},
		{ action = "<cmd>Telescope buffers<cr>", key = "<leader>b", mode = "n", options = { desc = "+buffer" } },
		{ action = "<cmd>Telescope resume<cr>", key = "<leader>fR", mode = "n", options = { desc = "Resume" } },
		{ action = "<cmd>Telescope buffers<cr>", key = "<leader>fb", mode = "n", options = { desc = "Buffers" } },
		{
			action = "<cmd>Telescope find_files<cr>",
			key = "<leader>ff",
			mode = "n",
			options = { desc = "Find project files" },
		},
		{ action = "<cmd>Telescope oldfiles<cr>", key = "<leader>fg", mode = "n", options = { desc = "Recent" } },
		{ action = "<cmd>Telescope live_grep<cr>", key = "<leader>fr", mode = "n", options = { desc = "Find text" } },
		{ action = "<cmd>Telescope git_commits<cr>", key = "<leader>gc", mode = "n", options = { desc = "Commits" } },
		{ action = "<cmd>Telescope git_status<cr>", key = "<leader>gs", mode = "n", options = { desc = "Status" } },
		{ action = "<cmd>Telescope commands<cr>", key = "<leader>sC", mode = "n", options = { desc = "Commands" } },
		{
			action = "<cmd>Telescope diagnostics<cr>",
			key = "<leader>sD",
			mode = "n",
			options = { desc = "Workspace diagnostics" },
		},
		{
			action = "<cmd>Telescope highlights<cr>",
			key = "<leader>sH",
			mode = "n",
			options = { desc = "Search Highlight Groups" },
		},
		{ action = "<cmd>Telescope man_pages<cr>", key = "<leader>sM", mode = "n", options = { desc = "Man pages" } },
		{ action = "<cmd>Telescope resume<cr>", key = "<leader>sR", mode = "n", options = { desc = "Resume" } },
		{
			action = "<cmd>Telescope autocommands<cr>",
			key = "<leader>sa",
			mode = "n",
			options = { desc = "Auto Commands" },
		},
		{
			action = "<cmd>Telescope current_buffer_fuzzy_find<cr>",
			key = "<leader>sb",
			mode = "n",
			options = { desc = "Buffer" },
		},
		{
			action = "<cmd>Telescope command_history<cr>",
			key = "<leader>sc",
			mode = "n",
			options = { desc = "Command History" },
		},
		{
			action = "<cmd>Telescope help_tags<cr>",
			key = "<leader>sh",
			mode = "n",
			options = { desc = "Help pages" },
		},
		{ action = "<cmd>Telescope keymaps<cr>", key = "<leader>sk", mode = "n", options = { desc = "Keymaps" } },
		{
			action = "<cmd>Telescope marks<cr>",
			key = "<leader>sm",
			mode = "n",
			options = { desc = "Jump to Mark" },
		},
		{ action = "<cmd>Telescope vim_options<cr>", key = "<leader>so", mode = "n", options = { desc = "Options" } },
		{
			action = "<cmd>Telescope colorscheme<cr>",
			key = "<leader>uC",
			mode = "n",
			options = { desc = "Colorscheme preview" },
		},
		{
			action = "<cmd>UndotreeToggle<CR>",
			key = "<leader>ut",
			mode = "n",
			options = { desc = "Undotree", silent = true },
		},
		{
			action = ":Oil<CR>",
			key = "-",
			mode = "n",
			options = { desc = "Open parent directory", silent = true },
		},
		{ action = ":Neotree<CR>", key = "<leader>e", mode = { "n", "v" }, options = { desc = "Tree", silent = true } },
		{
			action = "<cmd>Trouble preview_split toggle<cr>",
			key = "<leader>xx",
			mode = "n",
			options = { desc = "Diagnostics toggle", silent = true },
		},
		{
			action = "<cmd>Trouble symbols toggle focus=false<cr>",
			key = "<leader>us",
			mode = "n",
			options = { desc = "Symbols toggle", silent = true },
		},
		{
			action = "<cmd>Trouble preview_split toggle filter.buf=0<cr>",
			key = "<leader>xX",
			mode = "n",
			options = { desc = "Buffer Diagnostics toggle", silent = true },
		},
		{
			action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			key = "<leader>xl",
			mode = "n",
			options = { desc = "LSP Definitions / references / ... toggle", silent = true },
		},
		{
			action = "<cmd>Trouble loclist toggle<cr>",
			key = "<leader>xL",
			mode = "n",
			options = { desc = "Location List toggle", silent = true },
		},
		{
			action = "<cmd>Trouble qflist toggle<cr>",
			key = "<leader>xQ",
			mode = "n",
			options = { desc = "Quickfix List toggle", silent = true },
		},
		{
			action = "<cmd>lua require('flash').jump()<cr>",
			key = "s",
			mode = { "n", "x", "o" },
			options = { desc = "Flash" },
		},
		{
			action = "<cmd>lua require('flash').treesitter()<cr>",
			key = "S",
			mode = { "n", "x", "o" },
			options = { desc = "Flash Treesitter" },
		},
		{
			action = "<cmd>lua require('flash').remote()<cr>",
			key = "r",
			mode = "o",
			options = { desc = "Remote Flash" },
		},
		{
			action = "<cmd>lua require('flash').treesitter_search()<cr>",
			key = "R",
			mode = { "x", "o" },
			options = { desc = "Treesitter Search" },
		},
		{
			action = "<cmd>Telescope diagnostics bufnr=0<cr>",
			key = "<leader>sd",
			mode = "n",
			options = { desc = "Document diagnostics" },
		},
		{
			action = "<cmd>Telescope file_browser<cr>",
			key = "<leader>fe",
			mode = "n",
			options = { desc = "File browser" },
		},
		{
			action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			key = "<leader>fE",
			mode = "n",
			options = { desc = "File browser" },
		},
		{
			action = '<cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>\n',
			key = "<leader>un",
			mode = "n",
			options = { desc = "Dismiss All Notifications" },
		},
		{
			action = "<cmd>BufferLineCycleNext<cr>",
			key = "<Tab>",
			mode = "n",
			options = { desc = "Cycle to next buffer" },
		},
		{
			action = "<cmd>BufferLineCyclePrev<cr>",
			key = "<S-Tab>",
			mode = "n",
			options = { desc = "Cycle to previous buffer" },
		},
		{
			action = "<cmd>BufferLineCycleNext<cr>",
			key = "<S-l>",
			mode = "n",
			options = { desc = "Cycle to next buffer" },
		},
		{
			action = "<cmd>BufferLineCyclePrev<cr>",
			key = "<S-h>",
			mode = "n",
			options = { desc = "Cycle to previous buffer" },
		},
		{ action = "<cmd>bdelete<cr>", key = "<leader>bd", mode = "n", options = { desc = "Delete buffer" } },
		{ action = "<cmd>e #<cr>", key = "<leader>bb", mode = "n", options = { desc = "Switch to Other Buffer" } },
		{
			action = "<cmd>BufferLineCloseRight<cr>",
			key = "<leader>br",
			mode = "n",
			options = { desc = "Delete buffers to the right" },
		},
		{
			action = "<cmd>BufferLineCloseLeft<cr>",
			key = "<leader>bl",
			mode = "n",
			options = { desc = "Delete buffers to the left" },
		},
		{
			action = "<cmd>BufferLineCloseOthers<cr>",
			key = "<leader>bo",
			mode = "n",
			options = { desc = "Delete other buffers" },
		},
		{
			action = "<cmd>BufferLineTogglePin<cr>",
			key = "<leader>bp",
			mode = "n",
			options = { desc = "Toggle pin" },
		},
		{
			action = "<Cmd>BufferLineGroupClose ungrouped<CR>",
			key = "<leader>bP",
			mode = "n",
			options = { desc = "Delete non-pinned buffers" },
		},
		{
			action = ":lua require('smart-splits').move_cursor_left()<CR>",
			key = "<C-h>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').move_cursor_down()<CR>",
			key = "<C-j>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').move_cursor_up()<CR>",
			key = "<C-k>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').move_cursor_right()<CR>",
			key = "<C-l>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').resize_left()<CR>",
			key = "<A-h>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').resize_down()<CR>",
			key = "<A-j>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').resize_up()<CR>",
			key = "<A-k>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = ":lua require('smart-splits').resize_right()<CR>",
			key = "<A-l>",
			mode = "n",
			options = { silent = true },
		},
		{
			action = "gitblame",
			key = "<leader>gb",
			mode = { "n", "v" },
			options = { desc = "+blame", silent = true },
		},
		{
			action = ":GitBlameToggle<CR>",
			key = "<leader>gbt",
			mode = "n",
			options = { desc = "Toggle", silent = true },
		},
		{
			action = ":GitBlameCopySHA<CR>",
			key = "<leader>gbs",
			mode = "n",
			options = { desc = "Copy SHA", silent = true },
		},
		{
			action = ":GitBlameCopyFileURL<CR>",
			key = "<leader>gbc",
			mode = "n",
			options = { desc = "Copy URL", silent = true },
		},
		{
			action = ":GitBlameOpenFileURL<CR>",
			key = "<leader>gbo",
			mode = "n",
			options = { desc = "Open file URL", silent = true },
		},
		{
			action = "<cmd>LazyGit<CR>",
			key = "<leader>gg",
			mode = "n",
			options = { desc = "LazyGit (root dir)" },
		},
		{
			action = "gitsigns",
			key = "<leader>gh",
			mode = { "n", "v" },
			options = { desc = "+hunks", silent = true },
		},
		{
			action = ":Gitsigns blame_line<CR>",
			key = "<leader>ghb",
			mode = "n",
			options = { desc = "Blame line", silent = true },
		},
		{
			action = ":Gitsigns diffthis<CR>",
			key = "<leader>ghd",
			mode = "n",
			options = { desc = "Diff This", silent = true },
		},
		{
			action = ":Gitsigns reset_buffer<CR>",
			key = "<leader>ghR",
			mode = "n",
			options = { desc = "Reset Buffer", silent = true },
		},
		{
			action = ":Gitsigns stage_buffer<CR>",
			key = "<leader>ghS",
			mode = "n",
			options = { desc = "Stage Buffer", silent = true },
		},
		{
			action = "<cmd>lua vim.lsp.buf.format()<cr>",
			key = "<leader>cf",
			mode = { "n", "v" },
			options = { desc = "Format", silent = true },
		},
		{
			action = "<cmd>Lspsaga finder def<CR>",
			key = "gd",
			mode = "n",
			options = { desc = "Goto Definition", silent = true },
		},
		{
			action = "<cmd>Lspsaga finder ref<CR>",
			key = "gr",
			mode = "n",
			options = { desc = "Goto References", silent = true },
		},
		{
			action = "<cmd>Lspsaga finder imp<CR>",
			key = "gI",
			mode = "n",
			options = { desc = "Goto Implementation", silent = true },
		},
		{
			action = "<cmd>Lspsaga peek_type_definition<CR>",
			key = "gT",
			mode = "n",
			options = { desc = "Type Definition", silent = true },
		},
		{
			action = "<cmd>Lspsaga hover_doc<CR>",
			key = "K",
			mode = "n",
			options = { desc = "Hover", silent = true },
		},
		{
			action = "<cmd>Lspsaga outline<CR>",
			key = "<leader>cw",
			mode = "n",
			options = { desc = "Outline", silent = true },
		},
		{
			action = "<cmd>Lspsaga rename<CR>",
			key = "<leader>cr",
			mode = "n",
			options = { desc = "Rename", silent = true },
		},
		{
			action = "<cmd>Lspsaga code_action<CR>",
			key = "<leader>ca",
			mode = "n",
			options = { desc = "Code Action", silent = true },
		},
		{
			action = "<cmd>Lspsaga show_line_diagnostics<CR>",
			key = "<leader>cd",
			mode = "n",
			options = { desc = "Line Diagnostics", silent = true },
		},
		{
			action = "<cmd>Lspsaga diagnostic_jump_next<CR>",
			key = "[d",
			mode = "n",
			options = { desc = "Next Diagnostic", silent = true },
		},
		{
			action = "<cmd>Lspsaga diagnostic_jump_prev<CR>",
			key = "]d",
			mode = "n",
			options = { desc = "Previous Diagnostic", silent = true },
		},
		{ action = "+find/file", key = "<leader>f", mode = "n" },
		{ action = "+search", key = "<leader>s", mode = "n" },
		{ action = "+quit/session", key = "<leader>q", mode = "n" },
		{ action = "+git", key = "<leader>g", mode = { "n", "v" } },
		{ action = "+ui", key = "<leader>u", mode = "n" },
		{ action = "+windows", key = "<leader>w", mode = "n" },
		{ action = "+tab", key = "<leader><Tab>", mode = "n" },
		{ action = "+debug", key = "<leader>d", mode = { "n", "v" } },
		{ action = "+code", key = "<leader>c", mode = { "n", "v" } },
		{ action = "+test", key = "<leader>t", mode = { "n", "v" } },
		{
			action = "<cmd>tabnew<cr>",
			key = "<leader><tab><tab>",
			mode = "n",
			options = { desc = "New Tab", silent = true },
		},
		{
			action = "<cmd>tabclose<cr>",
			key = "<leader><tab>d",
			mode = "n",
			options = { desc = "Close tab", silent = true },
		},
		{
			action = "<C-W>p",
			key = "<leader>ww",
			mode = "n",
			options = { desc = "Other window", silent = true },
		},
		{
			action = "<C-W>c",
			key = "<leader>wd",
			mode = "n",
			options = { desc = "Delete window", silent = true },
		},
		{
			action = "<C-W>s",
			key = "<leader>w-",
			mode = "n",
			options = { desc = "Split window below", silent = true },
		},
		{
			action = "<C-W>v",
			key = "<leader>w|",
			mode = "n",
			options = { desc = "Split window right", silent = true },
		},
		{
			action = "<C-W>h",
			key = "<C-h>",
			mode = "n",
			options = { desc = "Move to window left", silent = true },
		},
		{
			action = "<C-W>l",
			key = "<C-l>",
			mode = "n",
			options = { desc = "Move to window right", silent = true },
		},
		{
			action = "<C-W>k",
			key = "<C-k>",
			mode = "n",
			options = { desc = "Move to window over", silent = true },
		},
		{
			action = "<C-W>j",
			key = "<C-j>",
			mode = "n",
			options = { desc = "Move to window bellow", silent = true },
		},
		{ action = "<cmd>w<cr><esc>", key = "<C-s>", mode = "n", options = { desc = "Save file", silent = true } },
		{
			action = "<cmd>quitall<cr><esc>",
			key = "<leader>qq",
			mode = "n",
			options = { desc = "Quit all", silent = true },
		},
		{
			action = ":lua ToggleLineNumber()<cr>",
			key = "<leader>ul",
			mode = "n",
			options = { desc = "Toggle Line Numbers", silent = true },
		},
		{
			action = ":lua ToggleRelativeLineNumber()<cr>",
			key = "<leader>uL",
			mode = "n",
			options = { desc = "Toggle Relative Line Numbers", silent = true },
		},
		{
			action = ":lua ToggleWrap()<cr>",
			key = "<leader>uw",
			mode = "n",
			options = { desc = "Toggle Line Wrap", silent = true },
		},
		{
			action = ":m '>+1<CR>gv=gv",
			key = "J",
			mode = "v",
			options = { desc = "Use move command when line is highlighted " },
		},
		{
			action = ":m '>-2<CR>gv=gv",
			key = "K",
			mode = "v",
			options = { desc = "Use move command when line is highlighted " },
		},
		{
			action = "mzJ`z",
			key = "J",
			mode = "n",
			options = { desc = "Allow cursor to stay in the same place after appending to current line " },
		},
		{
			action = "<C-d>zz",
			key = "<C-d>",
			mode = "n",
			options = { desc = "Allow C-d and C-u to keep the cursor in the middle" },
		},
		{
			action = "<C-u>zz",
			key = "<C-u>",
			mode = "n",
			options = { desc = "Allow C-d and C-u to keep the cursor in the middle" },
		},
		{ action = "nzzzv", key = "n", mode = "n", options = { desc = "Allow search terms to stay in the middle " } },
		{ action = "Nzzzv", key = "N", mode = "n", options = { desc = "Allow search terms to stay in the middle " } },
		{
			action = '"_dP',
			key = "<leader>p",
			mode = "x",
			options = { desc = "Deletes to void register and paste over" },
		},
		{ action = '"+y', key = "<leader>y", mode = { "n", "v" }, options = { desc = "Copy to system clipboard" } },
		{ action = '"+Y', key = "<leader>Y", mode = { "n", "v" }, options = { desc = "Copy to system clipboard" } },
		{ action = '"_d', key = "<leader>D", mode = { "n", "v" }, options = { desc = "Delete to void register" } },
		{ action = "<Esc>", key = "<C-c>", mode = "i" },
		{
			action = "<CMD> Grapple toggle <CR>",
			key = "<leader>m",
			mode = "n",
			options = { desc = "Grapple Toggle tag" },
		},
		{
			action = "<CMD> Grapple toggle_tags <CR>",
			key = "<leader>k",
			mode = "n",
			options = { desc = "Grapple Toggle tag" },
		},
		{
			action = "<CMD> Grapple toggle_scopes <CR>",
			key = "<leader>K",
			mode = "n",
			options = { desc = "Grapple Toggle scopes" },
		},
		{
			action = "<CMD> Grapple cycle forward <CR>",
			key = "<leader>j",
			mode = "n",
			options = { desc = "Grapple Cycle forward" },
		},
		{
			action = "<CMD> Grapple cycle backward <CR>",
			key = "<leader>J",
			mode = "n",
			options = { desc = "Grapple Cycle backward" },
		},
		{
			action = "<CMD> Grapple select index=1<CR>",
			key = "<leader>1",
			mode = "n",
			options = { desc = "Grapple Select 1" },
		},
		{
			action = "<CMD> Grapple select index=2<CR>",
			key = "<leader>2",
			mode = "n",
			options = { desc = "Grapple Select 2" },
		},
		{
			action = "<CMD> Grapple select index=3<CR>",
			key = "<leader>3",
			mode = "n",
			options = { desc = "Grapple Select 3" },
		},
		{
			action = "<CMD> Grapple select index=4<CR>",
			key = "<leader>4",
			mode = "n",
			options = { desc = "Grapple Select 4" },
		},
	}
	for i, map in ipairs(__nixvim_binds) do
		vim.keymap.set(map.mode, map.key, map.action, map.options)
	end
end
-- }}}

vim.filetype.add({ extension = { liq = "liquidsoap" } })

require("grapple").setup({
	scope = "git_branch",
})

require("telescope").setup({
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
})

local notify = require("notify")

local filtered_message = { "No information available" }

-- Override notify function to filter out messages
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(message, level, opts)
	local merged_opts = vim.tbl_extend("force", {
		on_open = function(win)
			local buf = vim.api.nvim_win_get_buf(win)
			vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
		end,
	}, opts or {})

	for _, msg in ipairs(filtered_message) do
		if message == msg then
			return
		end
	end
	return notify(message, level, merged_opts)
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.liquidsoap = {
	filetype = "liquidsoap",
}

require("gitpad").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	on_attach = function(bufnr)
		-- You can also define a function to be called when the gitpad window is opened, by setting the `on_attach` option:
		-- This is just an example
		vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<Cmd>wq<CR>", { noremap = true, silent = true })
	end,
})

local wk = require("which-key")

wk.add({
	{ "<leader>p", group = "gitpad" },
	{
		"<leader>pp",
		function()
			require("gitpad").toggle_gitpad()
		end,
		desc = "Project notes",
	},
	{
		"<leader>pb",
		function()
			require("gitpad").toggle_gitpad_branch()
		end,
		desc = "Branch notes",
	},
	{ "<leader>pv", group = "Vertical" },
	{
		"<leader>pvs",
		function()
			require("gitpad").toggle_gitpad_branch({ window_type = "split", split_win_opts = { split = "right" } })
		end,
		desc = "Branch vertical split",
	},
	{
		"<leader>pd",
		function()
			local date_filename = "daily-" .. os.date("%Y-%m-%d.md")
			require("gitpad").toggle_gitpad({ filename = date_filename })
		end,
		desc = "Daily notes",
	},
	{
		"<leader>pf",
		function()
			local filename = vim.fn.expand("%:p")
			if filename == "" then
				vim.notify("empty bufname")
				return
			end
			filename = vim.fn.pathshorten(filename, 2) .. ".md"
			require("gitpad").toggle_gitpad({ filename = filename })
		end,
		desc = "Per file notes",
	},
})

require("telescope").load_extension("lazygit")

local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = _border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = _border,
})

vim.diagnostic.config({
	float = { border = _border },
})

require("lspconfig.ui.windows").default_options = {
	border = _border,
}

local default_conf = {
	enable = true,
	notify = false,
	exclude_filetypes = {
		alpha = true,
		dashboard = true,
		-- some other exclude_filetypes
	},
}

local chunk_conf = {
	enable = true,
	priority = 15,
	style = {
		{ fg = "#A988B0" },
		{ fg = "#c21f30" },
	},
	use_treesitter = true,
	chars = {
		horizontal_line = "─",
		vertical_line = "│",
		left_top = "╭",
		left_bottom = "╰",
		right_arrow = ">",
	},
	textobject = "",
	max_file_size = 1024 * 1024, -- 1MB
	error_sign = true,
	duration = 200,
	delay = 300,
}

local line_num_conf = {
	enable = true,
	style = "#E8E3E3",
	priority = 10,
	use_treesitter = false,
}

-- Now merge these configurations into your hlchunk setup
require("hlchunk").setup({
	chunk = chunk_conf,
	line_num = line_num_conf,
	-- you can add more configurations here
})

luasnip = require("luasnip")
kind_icons = {
	Text = "󰊄",
	Method = "",
	Function = "󰡱",
	Constructor = "",
	Field = "",
	Variable = "󱀍",
	Class = "",
	Interface = "",
	Module = "󰕳",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local cmp = require("cmp")

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	sources = {
		{ name = "buffer" },
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	--      formatting = {
	--       format = function(_, vim_item)
	--         vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
	--       return vim_item
	--      end
	-- }
})
function ToggleLineNumber()
	if vim.wo.number then
		vim.wo.number = false
	else
		vim.wo.number = true
		vim.wo.relativenumber = false
	end
end

function ToggleRelativeLineNumber()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
		vim.wo.number = false
	end
end

function ToggleWrap()
	vim.wo.wrap = not vim.wo.wrap
end

_G.theme = "paradise"

-- Set up autogroups {{
do
	local __nixvim_autogroups = { nixvim_binds_LspAttach = { clear = true } }

	for group_name, options in pairs(__nixvim_autogroups) do
		vim.api.nvim_create_augroup(group_name, options)
	end
end
-- }}
-- Set up autocommands {{
do
	local __nixvim_autocommands = {
		{
			callback = function()
				do
					local __nixvim_binds = {
						{
							action = vim.diagnostic.open_float,
							key = "<leader>cd",
							mode = "n",
							options = { desc = "Line Diagnostics", silent = true },
						},
						{
							action = vim.diagnostic.goto_next,
							key = "[d",
							mode = "n",
							options = { desc = "Next Diagnostic", silent = true },
						},
						{
							action = vim.diagnostic.goto_prev,
							key = "]d",
							mode = "n",
							options = { desc = "Previous Diagnostic", silent = true },
						},
						{
							action = vim.lsp.buf.rename,
							key = "<leader>cr",
							mode = "n",
							options = { desc = "Rename", silent = true },
						},
						{
							action = vim.lsp.buf.workspace_symbol,
							key = "<leader>cw",
							mode = "n",
							options = { desc = "Workspace Symbol", silent = true },
						},
						{
							action = vim.lsp.buf.hover,
							key = "K",
							mode = "n",
							options = { desc = "Hover", silent = true },
						},
						{
							action = vim.lsp.buf.declaration,
							key = "gD",
							mode = "n",
							options = { desc = "Goto Declaration", silent = true },
						},
						{
							action = vim.lsp.buf.implementation,
							key = "gI",
							mode = "n",
							options = { desc = "Goto Implementation", silent = true },
						},
						{
							action = vim.lsp.buf.type_definition,
							key = "gT",
							mode = "n",
							options = { desc = "Type Definition", silent = true },
						},
						{
							action = vim.lsp.buf.definition,
							key = "gd",
							mode = "n",
							options = { desc = "Goto Definition", silent = true },
						},
						{
							action = vim.lsp.buf.references,
							key = "gr",
							mode = "n",
							options = { desc = "Goto References", silent = true },
						},
					}
					for i, map in ipairs(__nixvim_binds) do
						vim.keymap.set(map.mode, map.key, map.action, map.options)
					end
				end
			end,
			desc = "Load keymaps for LspAttach",
			event = "LspAttach",
			group = "nixvim_binds_LspAttach",
		},
		{ command = "norm zz", event = "InsertEnter" },
		{ command = "wincmd L", event = "FileType", pattern = "help" },
		{
			command = "setlocal spell spelllang=en,uk | set conceallevel=1 | set linebreak | set textwidth=80 ",
			event = "FileType",
			pattern = { "tex", "latex", "markdown" },
		},
	}

	for _, autocmd in ipairs(__nixvim_autocommands) do
		vim.api.nvim_create_autocmd(autocmd.event, {
			group = autocmd.group,
			pattern = autocmd.pattern,
			buffer = autocmd.buffer,
			desc = autocmd.desc,
			callback = autocmd.callback,
			command = autocmd.command,
			once = autocmd.once,
			nested = autocmd.nested,
		})
	end
end
-- }}
