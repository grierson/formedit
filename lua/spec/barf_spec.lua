-- [nfnl] Compiled from fnl/spec/barf_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local barf = require("formedit.barf")
local forward_keymap = "<)"
local backward_keymap = ">("
local function _2_()
  local function _3_()
    return vim.keymap.set("n", forward_keymap, barf.forward)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "((1 2))", cursor = {1, 1}})
    h.feedkeys(forward_keymap)
    return h.expect({content = "((1) 2)", cursor = {1, 1}})
  end
  it("element", _4_)
  local function _5_()
    h.setup({content = "(((1) (2)))", cursor = {1, 1}})
    h.feedkeys(forward_keymap)
    return h.expect({content = "(((1)) (2))", cursor = {1, 1}})
  end
  return it("form", _5_)
end
describe("barf forward", _2_)
local function _6_()
  local function _7_()
    return vim.keymap.set("n", backward_keymap, barf.backward)
  end
  before_each(_7_)
  local function _8_()
    h.setup({content = "((1 2))", cursor = {1, 1}})
    h.feedkeys(backward_keymap)
    return h.expect({content = "(1 (2))", cursor = {1, 1}})
  end
  it("element", _8_)
  local function _9_()
    h.setup({content = "(((1) 2))", cursor = {1, 1}})
    h.feedkeys(backward_keymap)
    return h.expect({content = "((1) (2))", cursor = {1, 1}})
  end
  return it("form", _9_)
end
return describe("barf backwards", _6_)
