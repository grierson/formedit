-- [nfnl] Compiled from fnl/formedit/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("nfnl.notify")
local ts = require("nvim-treesitter.ts_utils")
local function setup()
  return notify.info("hello")
end
return {setup = setup}
