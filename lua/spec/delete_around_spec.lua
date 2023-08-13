-- [nfnl] Compiled from fnl/spec/delete_around_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local tree = require("formedit.tree")
local function _2_()
  local function _3_()
    return vim.keymap.set("o", "af", tree["select-form"])
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1)", cursor = {1, 1}})
    h.feedkeys("daf")
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("list", _4_)
  local function _5_()
    h.setup({content = "[1]", cursor = {1, 1}})
    h.feedkeys("daf")
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("vector", _5_)
  local function _6_()
    h.setup({content = "#{1}", cursor = {1, 1}})
    h.feedkeys("daf")
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("set", _6_)
  local function _7_()
    h.setup({content = "#(fn [x] x)", cursor = {1, 1}})
    h.feedkeys("daf")
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("anonymous function", _7_)
  local function _8_()
    h.setup({content = "([1] [2])", cursor = {1, 0}})
    h.feedkeys("daf")
    return h.expect({content = "", cursor = {1, 0}})
  end
  it("delete multiple children", _8_)
  local function _9_()
    h.setup({content = {"([1]", "[2])"}, cursor = {1, 0}})
    h.feedkeys("daf")
    return h.expect({content = "", cursor = {1, 0}, lines = 1})
  end
  return it("delete across lines", _9_)
end
return describe("delete around", _2_)
