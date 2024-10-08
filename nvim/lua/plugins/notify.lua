return {
  "rcarriga/nvim-notify",
  opts = {
    stages = "slide",
  },
  keys = {
    {
      "<leader>und",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader>unh",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "View notification history",
    },
  },
}
