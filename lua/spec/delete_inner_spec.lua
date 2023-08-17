-- [nfnl] Compiled from fnl/spec/delete_inner_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local select = require("formedit.select")
local function _2_()
  local function _3_()
    return vim.keymap.set("o", "if", select.inner)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1)", cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "()", cursor = {1, 1}})
  end
  it("list", _4_)
  local function _5_()
    h.setup({content = "#{1}", cursor = {1, 0}})
    h.feedkeys("dif")
    return h.expect({content = "#{}", cursor = {1, 2}})
  end
  return it("set", _5_)
end
describe("delete inner form", _2_)
local function _6_()
  local function _7_()
    return vim.keymap.set("o", "iF", select["inner-root"])
  end
  before_each(_7_)
  local function _8_()
    h.setup({content = "([1] 2)", cursor = {1, 1}})
    h.feedkeys("diF")
    return h.expect({content = "()", cursor = {1, 1}})
  end
  it("within first node", _8_)
  local function _9_()
    h.setup({content = "(1 [2])", cursor = {1, 3}})
    h.feedkeys("diF")
    return h.expect({content = "()", cursor = {1, 1}})
  end
  return it("within second node", _9_)
end
return describe("delete inner root form", _6_)
