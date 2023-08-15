-- [nfnl] Compiled from fnl/spec/wrap_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local before_each = _local_1_["before_each"]
local h = require("spec.helper")
local wrap = require("formedit.wrap")
local keymap = "<localleader>i"
local function _2_()
  local function _3_()
    vim.g.maplocalleader = keymap
    return vim.keymap.set("n", keymap, wrap.head)
  end
  before_each(_3_)
  local function _4_()
    h.setup({content = "(1)", cursor = {1, 0}})
    h.feedkeys(keymap)
    return h.expect({content = "( (1))", cursor = {1, 1}})
  end
  it("form head", _4_)
  local function _5_()
    h.setup({content = "(1 (2))", cursor = {1, 4}})
    h.feedkeys(keymap)
    return h.expect({content = "(1 ( (2)))", cursor = {1, 4}})
  end
  return it("sub form", _5_)
end
return describe("wrap", _2_)
