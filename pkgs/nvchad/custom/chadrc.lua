---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "catppuccin",
}


M.mappings = require("custom.mappings")
M.settings = "custom.extras"
M.plugins = "custom.plugins"

return M
