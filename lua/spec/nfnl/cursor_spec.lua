-- [nfnl] Compiled from fnl/spec/nfnl/cursor_spec.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("plenary.busted")
local describe = _local_1_["describe"]
local it = _local_1_["it"]
local h = require("spec.nfnl.helper")
local function _2_()
  local function _3_()
    h.setup({content = "(a)", cursor = {1, 1}})
    vim.api.nvim_win_set_cursor(0, {1, 2})
    return h.expect({content = "(a)", cursor = {1, 2}})
  end
  it("forward", _3_)
  local function _4_()
    h.setup({content = "(a)", cursor = {1, 2}})
    vim.api.nvim_win_set_cursor(0, {1, 1})
    return h.expect({content = "(a)", cursor = {1, 1}})
  end
  return it("back", _4_)
end
return describe("move cursor", _2_)
