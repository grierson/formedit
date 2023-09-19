-- [nfnl] Compiled from fnl/spec/raise_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local raise = require("formedit.raise")
local localleader = ","
local raise_form_keymap = "<localleader>o"
local raise_element_keymap = "<localleader>O"
local function _2_()
  local function _3_()
    vim.g.maplocalleader = localleader
    vim.keymap.set("n", raise_form_keymap, raise.form)
    return vim.keymap.set("n", raise_element_keymap, raise.element)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(+ 1 (+ 2 3))", cursor = {1, 5}})
    h.feedkeys(raise_form_keymap)
    return h.expect({content = "(+ 2 3)", cursor = {1, 0}})
  end
  return it("form", _4_)
end
describe("raise-form", _2_)
local function _5_()
  local function _6_()
    vim.g.maplocalleader = localleader
    vim.keymap.set("n", raise_form_keymap, raise.form)
    return vim.keymap.set("n", raise_element_keymap, raise.element)
  end
  before_each(_6_)
  local function _7_()
    h.setup({content = "(+ 1 (+ 2 3))", cursor = {1, 8}})
    h.feedkeys(raise_element_keymap)
    return h.expect({content = "(+ 1 2)", cursor = {1, 5}})
  end
  it("first-element", _7_)
  local function _8_()
    h.setup({content = "(+ 1 (+ 2 3))", cursor = {1, 10}})
    h.feedkeys(raise_element_keymap)
    return h.expect({content = "(+ 1 3)", cursor = {1, 5}})
  end
  return it("second-element", _8_)
end
return describe("raise-element", _5_)
