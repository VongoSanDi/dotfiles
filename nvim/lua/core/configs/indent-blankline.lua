local ok, ib = pcall(require, "indent_blankline")
if not ok then return end

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

ib.setup{
	filetype_exclude = {
	"vimwiki",
	"man",
	"gitmessengerpopup",
	"diagnosticpopup",
	"lspinfo",
	"packer",
	"checkhealth",
	"TelescopePrompt",
	"TelescopeResults",
	""
	},
	buftype_exclude = {
		"Terminal"
	},
	space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
	}
}

--vim.opt.listchars:append "space:⋅" -- Permet d'afficher un petit point entre chaque espace
vim.opt.listchars:append "eol:↴"
