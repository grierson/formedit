-- [nfnl] Compiled from fnl/spec/insertion_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local insertion = require("formedit.insertion")
local head_keymap = "<localleader>h"
local tail_keymap = "<localleader>t"
local function _2_()
  local function _3_()
    vim.g.maplocalleader = ","
    return vim.keymap.set("n", head_keymap, insertion.head)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1)", cursor = {1, 0}})
    h.feedkeys(head_keymap)
    return h.expect({content = "( 1)", cursor = {1, 1}})
  end
  it("form", _4_)
  local function _5_()
    h.setup({content = "#{1}", cursor = {1, 0}})
    h.feedkeys(head_keymap)
    return h.expect({content = "#{ 1}", cursor = {1, 2}})
  end
  it("set", _5_)
  local function _6_()
    h.setup({content = "(1 (2))", cursor = {1, 3}})
    h.feedkeys(head_keymap)
    return h.expect({content = "(1 ( 2))", cursor = {1, 4}})
  end
  return it("sub form", _6_)
end
describe("head insertion", _2_)
local function _7_()
  local function _8_()
    vim.g.maplocalleader = ","
    return vim.keymap.set("n", tail_keymap, insertion.tail)
  end
  before_each(_8_)
  local function _9_()
    h.setup({content = "(1)", cursor = {1, 0}})
    h.feedkeys(tail_keymap)
    return h.expect({content = "(1 )", cursor = {1, 2}})
  end
  it("form", _9_)
  local function _10_()
    h.setup({content = "(1 (2))", cursor = {1, 4}})
    h.feedkeys(tail_keymap)
    return h.expect({content = "(1 (2 ))", cursor = {1, 5}})
  end
  return it("sub", _10_)
end
return describe("tail insertion", _7_)
