return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_module", -- Hide node_module folder by defaults
        "%.lock", -- Hide all .lock files by defaults
      },
    },
  },
  keys = {
    { "<leader>sg", LazyVim.pick("live_grep"), desc = "Find words" },
    { "<leader>sG", LazyVim.pick("live_grep", { root = false, hidden = true }), desc = "Find words even hidden" },
  },
}
