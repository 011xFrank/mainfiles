return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    require("barbecue").setup({
      exclude_filetypes = { "NvimTree" },
      theme = {
        normal = { fg = "#89c4a0" }, -- Neon green
        ellipsis = { fg = "#428a65" }, -- Darker neon green
        separator = { fg = "#428a65" },
        modified = { fg = "#428a65" },
        dirname = { fg = "#428a65" },
        context_file = { fg = "#89c4a0" }, -- Neon green
        context_module = { fg = "#89c4a0" },
        context_namespace = { fg = "#89c4a0" },
        context_package = { fg = "#89c4a0" },
        context_class = { fg = "#89c4a0" },
        context_method = { fg = "#89c4a0" },
        context_property = { fg = "#89c4a0" },
        context_field = { fg = "#89c4a0" },
        context_constructor = { fg = "#89c4a0" },
        context_enum = { fg = "#89c4a0" },
        context_interface = { fg = "#89c4a0" },
        context_function = { fg = "#89c4a0" },
        context_variable = { fg = "#89c4a0" },
        context_constant = { fg = "#89c4a0" },
        context_string = { fg = "#89c4a0" },
        context_number = { fg = "#89c4a0" },
        context_boolean = { fg = "#89c4a0" },
        context_array = { fg = "#89c4a0" },
        context_object = { fg = "#89c4a0" },
        context_key = { fg = "#89c4a0" },
        context_null = { fg = "#89c4a0" },
        context_enum_member = { fg = "#89c4a0" },
        context_struct = { fg = "#89c4a0" },
        context_event = { fg = "#89c4a0" },
        context_operator = { fg = "#89c4a0" },
        context_type_parameter = { fg = "#89c4a0" },
      }
    })
  end
}
