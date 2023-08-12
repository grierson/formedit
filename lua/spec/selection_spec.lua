-- [nfnl] Compiled from fnl/spec/selection_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local h = require("spec.helper")
local tree = require("formedit.tree")
local assert = require("luassert.assert")
local selection = require("formedit.selection")
local ts = require("nvim-treesitter.ts_utils")
local function _2_()
  local function _3_()
    h.setup({content = "(a)", cursor = {1, 1}})
    local node = ts.get_node_at_cursor()
    local form = tree["get-form"](node)
    return assert.are.same({0, 0, 0, 3}, {form:range()})
  end
  return it("list", _3_)
end
describe("selection", _2_)
local function _4_()
  local function _5_()
    h.setup({content = "(1)", cursor = {1, 1}})
    selection["delete-around-form"]()
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("list", _5_)
  local function _6_()
    h.setup({content = "[1]", cursor = {1, 1}})
    selection["delete-around-form"]()
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("vector", _6_)
  local function _7_()
    h.setup({content = "#{1}", cursor = {1, 1}})
    selection["delete-around-form"]()
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("set", _7_)
  local function _8_()
    h.setup({content = "#(fn [x] x)", cursor = {1, 1}})
    selection["delete-around-form"]()
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("anonymous function", _8_)
  local function _9_()
    h.setup({content = "([1] [2])", cursor = {1, 0}})
    selection["delete-around-form"]()
    return h.expect({content = "", cursor = {1, 0}})
  end
  return it("delete multiple children", _9_)
end
describe("delete around", _4_)
local function _10_()
  local function _11_()
    h.setup({content = "(1)", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "()", cursor = {1, 1}})
  end
  it("list", _11_)
  local function _12_()
    h.setup({content = "[1]", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "[]", cursor = {1, 1}})
  end
  it("vector", _12_)
  local function _13_()
    h.setup({content = "#{1}", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "#{}", cursor = {1, 1}})
  end
  it("set", _13_)
  local function _14_()
    h.setup({content = "#(fn [x] x)", cursor = {1, 1}})
    selection["delete-inner-form"]()
    return h.expect({content = "#()", cursor = {1, 1}})
  end
  it("anonymous function", _14_)
  local function _15_()
    h.setup({content = "([1] [2])", cursor = {1, 0}})
    selection["delete-inner-form"]()
    return h.expect({content = "()", cursor = {1, 0}})
  end
  return it("delete multiple children", _15_)
end
return describe("delete inner", _10_)
