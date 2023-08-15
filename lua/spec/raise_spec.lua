-- [nfnl] Compiled from fnl/spec/raise_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local raise = require("formedit.raise")
local keymap = "<localleader>o"
local function _2_()
  local function _3_()
    vim.g.maplocalleader = keymap
    return vim.keymap.set("n", keymap, raise.form)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1 (2))", cursor = {1, 4}})
    h.feedkeys(keymap)
    return h.expect({content = "(2)", cursor = {1, 2}})
  end
  return it("form", _4_)
end
return describe("raise", _2_)
