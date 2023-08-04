require "custom.extras"

local opt = vim.opt
local g = vim.g

-- Vim Options
opt.relativenumber = true
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/configs/luasnippets"
