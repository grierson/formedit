-- [nfnl] Compiled from fnl/spec/selection_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local h = require("spec.helper")
local tree = require("formedit.tree")
local assert = require("luassert.assert")
local function _2_()
  local function _3_()
    h.setup({content = "(a)", cursor = {1, 1}})
    local form = tree["get-current-form"]()
    return assert.are.same({0, 0, 0, 3}, {form:range()})
  end
  return it("list", _3_)
end
return describe("selection", _2_)