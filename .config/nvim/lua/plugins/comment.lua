return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function ()
      local comment = require("Comment")

      comment.setup({
        toggler = {
          line = "<leader>/",
        },
        opleader = {
          line = "<leader>/",
          block = "<leader>/"
        }
      })
    end
}
