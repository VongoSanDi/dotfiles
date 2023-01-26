local ok, formatter = pcall(require, "formatter")
if not ok then return end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		html = {
			require("formatter.filetypes.html").prettier
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		svelte = {
			require("formatter.filetypes.svelte"),
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		--[[lua = {
						require("formatter.filetypes.lua").luaformat,
						require("formatter.filetypes.lua").stylua,
				},]]
	},
})
