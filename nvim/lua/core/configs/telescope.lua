local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
			respect_gitignore = true,
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
		--[[fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
    }]]
  },
}

telescope.load_extension("file_browser")
--telescope.load_extension('fzf')

vim.keymap.set("n", "<leader>fd", ":Telescope file_browser<CR>") -- Permet de chercher dans le dossier de travail
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h<CR>", {silent = true}) -- Permet de chercher dans le dossier courant
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {silent = true})
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {silent = true}) -- Permet de chercher un caractère ou un mot dans le dossier de travail
vim.keymap.set('n', '<leader>d', function()
  builtin.diagnostics()
end)
