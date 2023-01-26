local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
  clipboard = "unnamedplus",
	number = true,
  relativenumber = true,
	title = true,
  timeoutlen = 1000,
	autoindent = true,
  smartindent = true, -- insert indents automatically
	hlsearch = true,
	incsearch = true,
	backup = false,
	cmdheight = 1,
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
	laststatus = 2,
	expandtab = false,	-- Controls whether or not Neovim should transform a Tab character to spaces
	backupskip = "/tmp/*, /private/tmp",
  inccommand = "split",
  ignorecase = true, -- Case insensitive searching UNLESS /C or capital in search
  smarttab = true,
  breakindent = true,
  shiftwidth = 2,
  tabstop = 2,
  ai = true,       -- Auto indent
  si =  true,      -- Smart indent
  wrap = false, -- Do not wrap the text at the end of the screen
  backspace = "start,eol,indent",  -- ! Important to not put spaces in this characters chain !
  splitbelow = true,
  splitright = true,
  conceallevel = 0,
  signcolumn = "yes",
  scrolloff = 8,
  sidescrolloff = 8,
  updatetime = 250,
  termguicolors = true, -- truecolor support
  wildoptions = 'pum',
  pumheight = 10,
  background = 'dark',
  cursorline = true,
	showcmd = true,		-- Show (partial) command in the last line of the screen.
	autoread = true,		-- When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
	list = true,				-- show some invisible characters, such as > for indent
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
	vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300
		})
	end
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
