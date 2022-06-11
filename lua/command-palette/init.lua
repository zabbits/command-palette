local M = {}

local config = require("command-palette.config")
local strategy = require("command-palette.strategy")
local PaletteNode = require("command-palette.palette_node")

function M.setup(opts)
  opts = opts or {}
  config.config = vim.tbl_deep_extend("force", config.config, opts)
  strategy.change_strategy(config.config.strategy)
  local fake_node = {
    label = "Command Palette",
    children = config.config.nodes,
  }

  M.palette = PaletteNode.new(fake_node, nil)
  return M.palette
end

return M