-- [nfnl] Compiled from fnl/formedit/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local ts = require("nvim-treesitter.ts_utils")
local current_node = ts.get_node_at_cursor()
local cursor_pos = vim.api.nvim_win_get_cursor(0)
local function setup()
  return notify.info("hello")
end
return {setup = setup}
