-- [nfnl] Compiled from fnl/spec/delete_inside_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local select = require("formedit.select")
local function _2_()
  local function _3_()
    return vim.keymap.set("o", "if", select["select-form"])
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1)", cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "()", cursor = {1, 0}})
  end
  it("list", _4_)
  local function _5_()
    h.setup({content = "[1]", cursor = {1, 1}})
    h.feedkeys("dif")
    return h.expect({content = "[]", cursor = {1, 1}})
  end
  it("vector", _5_)
  local function _6_()
    h.setup({content = "#{1}", cursor = {1, 1}})
    h.feedkeys("dif")
    return h.expect({content = "#{}", cursor = {1, 1}})
  end
  it("set", _6_)
  local function _7_()
    h.setup({content = "#(fn [x] x)", cursor = {1, 1}})
    h.feedkeys("dif")
    return h.expect({content = "#()", cursor = {1, 1}})
  end
  it("anonymous function", _7_)
  local function _8_()
    h.setup({content = "([1] [2])", cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "()", cursor = {1, 0}})
  end
  return it("delete multiple children", _8_)
end
describe("delete inside", _2_)
local function _9_()
  local function _10_()
    h.setup({content = {"(1", "2)"}, cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "()", cursor = {1, 0}})
  end
  it("list", _10_)
  local function _11_()
    h.setup({content = {"[1", "2]"}, cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "[]", cursor = {1, 0}})
  end
  it("vector", _11_)
  local function _12_()
    h.setup({content = {"#{1", "2}"}, cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "#{}", cursor = {1, 0}})
  end
  return it("set", _12_)
end
return describe("delete inside across lines", _9_)
