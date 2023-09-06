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
    h.setup({content = "(1 (2))", cursor = {1, 4}})
    h.feedkeys(raise_form_keymap)
    return h.expect({content = "(2)", cursor = {1, 2}})
  end
  it("form", _4_)
  local function _5_()
    h.setup({content = "(+ 1 (+ 2 3))", cursor = {1, 8}})
    h.feedkeys(raise_element_keymap)
    return h.expect({content = "(+ 1 2)", cursor = {1, 6}})
  end
  return it("element", _5_)
end
describe("raise", _2_)
return print("End")
