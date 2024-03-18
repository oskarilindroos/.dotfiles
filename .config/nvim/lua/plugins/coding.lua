return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = function(_, opts)
      local cmp = require("cmp")

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        completion = { completeopt = "noselect" },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        },
      })
    end,
  },
}
