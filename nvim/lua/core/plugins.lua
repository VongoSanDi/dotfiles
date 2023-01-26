local fn = vim.fn

-- Automatically install packer
local ensure_packer = function()
	local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system {
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		}
		print "Installing packer close and reopen Neovim..."
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	-- Have packer manage itself
	use { "wbthomason/packer.nvim" }

	-- Theme
	use{
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			require("core.configs.rose-pine")
		end
	}

	-- Comon utilities
	use { "nvim-lua/plenary.nvim" }

	-- Statusline
	use { "nvim-lualine/lualine.nvim",
		config = function()
			require("core.configs.lualine")
		end
	}

	-- Formatter
	use{
		"mhartington/formatter.nvim",
		config = function()
			require("core.configs.formatter")
		end,
	}

	use { 'kdheepak/lazygit.nvim',
		config = function()
			require("core.configs.lazygit")
		end
	}

	-- Notification
	use { "rcarriga/nvim-notify",
		config = function()
			require("core.configs.notify")
		end
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		requires = {"nvim-tree/nvim-web-devicons"},
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("core.configs.treesitter")
		end
	}

	use {"nvim-treesitter/nvim-treesitter-textobjects",
		after = 'nvim-treesitter',
	}

	-- File Explorer
	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
		config = function()
			require("core.configs.neotree")
		end
  }

	-- Comments
	use { "numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("core.configs.comment")
		end,
	}

	use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("core.configs.todo-comments")
  end
}

	-- Fuzy finder
	use { "nvim-telescope/telescope.nvim",
		config = function()
			require("core.configs.telescope")
		end
	}

	--  File browser extension for telescope.nvim
	use { "nvim-telescope/telescope-file-browser.nvim" }

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  --use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
	-- Autopairs
	use { "windwp/nvim-autopairs",
		config = function()
			require("core.configs.autopairs")
		end
	}

	-- Use treesitter to autoclose and autorename
	-- It work with html,tsx,vue,svelte,php,rescript.
	use { "windwp/nvim-ts-autotag",
		config = function()
			require("core.configs.ts-autotag")
		end
	}

	use {'romgrk/barbar.nvim',
		wants = 'nvim-web-devicons',
		config = function()
			require("core.configs.barbar")
		end
	}

	--Indent Blankline
	use { "lukas-reineke/indent-blankline.nvim",
		config = function()
			require("core.configs.indent-blankline")
		end
	}

	-- Better Escape
	use { "max397574/better-escape.nvim",
  config = function()
    require("core.configs.better-escape")
  end,
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		},
		config = function()
			require("core.configs.lsp")
		end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end

end)
