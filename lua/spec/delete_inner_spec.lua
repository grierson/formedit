-- [nfnl] Compiled from fnl/spec/delete_inner_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local h = require("spec.helper")
local selection = require("formedit.selection")
local function _2_()
  local function _3_()
    h.setup({content = "(1)", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "()", cursor = {1, 1}})
  end
  it("list", _3_)
  local function _4_()
    h.setup({content = "[1]", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "[]", cursor = {1, 1}})
  end
  it("vector", _4_)
  local function _5_()
    h.setup({content = "#{1}", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "#{}", cursor = {1, 1}})
  end
  it("set", _5_)
  local function _6_()
    h.setup({content = "#(fn [x] x)", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "#()", cursor = {1, 1}})
  end
  it("anonymous function", _6_)
  local function _7_()
    h.setup({content = "([1] [2])", cursor = {1, 0}})
    selection["delete-inner-form"]()
    return h.expect({content = "()", cursor = {1, 0}})
  end
  it("delete multiple children", _7_)
  local function _8_()
    h.setup({content = {"([1],", "[2])"}, cursor = {1, 0}})
    selection["delete-inner-form"]()
    return h.expect({content = "()", cursor = {1, 0}, lines = 2})
  end
  return it("delete across lines", _8_)
end
return describe("delete inner", _2_)
