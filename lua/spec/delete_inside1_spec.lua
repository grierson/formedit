-- [nfnl] Compiled from fnl/spec/delete_inside1_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local tree = require("formedit.tree")
local function _2_()
  local function _3_()
    return vim.keymap.set("o", "if", tree["select-form"])
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1)", cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "()", cursor = {1, 0}})
  end
  return it("list", _4_)
end
return describe("delete inside", _2_)
