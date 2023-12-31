-- [nfnl] Compiled from fnl/spec/slurp_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local slurp = require("formedit.slurp")
local forward_keymap = ">)"
local backward_keymap = "<("
local function _2_()
  local function _3_()
    return vim.keymap.set("n", forward_keymap, slurp.forward)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "((1) 2)", cursor = {1, 1}})
    h.feedkeys(forward_keymap)
    return h.expect({content = "((1 2))", cursor = {1, 1}})
  end
  it("element", _4_)
  local function _5_()
    h.setup({content = "((1) (+ 2 3))", cursor = {1, 1}})
    h.feedkeys(forward_keymap)
    return h.expect({content = "((1 (+ 2 3)))", cursor = {1, 1}})
  end
  it("form", _5_)
  local function _6_()
    h.setup({content = "(#{1} 2)", cursor = {1, 1}})
    h.feedkeys(forward_keymap)
    return h.expect({content = "(#{1 2})", cursor = {1, 1}})
  end
  return it("set", _6_)
end
describe("slurp forward", _2_)
local function _7_()
  local function _8_()
    return vim.keymap.set("n", backward_keymap, slurp.backward)
  end
  before_each(_8_)
  local function _9_()
    h.setup({content = "(1 (2))", cursor = {1, 3}})
    h.feedkeys(backward_keymap)
    return h.expect({content = "((1 2))", cursor = {1, 3}})
  end
  it("element", _9_)
  local function _10_()
    h.setup({content = "((1) (+ 2 3))", cursor = {1, 5}})
    h.feedkeys(backward_keymap)
    return h.expect({content = "(((1) + 2 3))", cursor = {1, 5}})
  end
  it("form", _10_)
  local function _11_()
    h.setup({content = "(1 #{2})", cursor = {1, 3}})
    h.feedkeys(backward_keymap)
    return h.expect({content = "(#{1 2})", cursor = {1, 3}})
  end
  return it("set", _11_)
end
return describe("slurp backwards", _7_)
