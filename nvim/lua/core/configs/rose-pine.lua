local status, rp = pcall(require, "rose-pine")
if not status then return end

rp.setup{
	dark_variant = "moon"
}

vim.cmd("colorscheme rose-pine")
