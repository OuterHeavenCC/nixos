-- n, v, i, t = mode names
local M = {}

M.general = {
  n = {
    -- easier search
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
  },

  i = {
    ["<A-n>"] = { "<Plug>luasnip-next-choice" },
    ["<A-p>"] = { "<Plug>luasnip-prev-choice" },
  }
}

return M
