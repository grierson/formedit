-- [nfnl] Compiled from fnl/formedit/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("formedit.nfnl.module")
local autoload = _local_1_["autoload"]
local notify = autoload("formedit.nfnl.notify")
local function setup()
  return notify.info("Hello, World!")
end
return {setup = setup}
