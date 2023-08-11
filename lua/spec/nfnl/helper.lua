-- [nfnl] Compiled from fnl/spec/nfnl/helper.fnl by https://github.com/Olical/nfnl, do not edit.
local assert = require("luassert.assert")
local core = require("formedit.nfnl.core")
local function setup(_1_)
  local _arg_2_ = _1_
  local cursor = _arg_2_["cursor"]
  local content = _arg_2_["content"]
  vim.api.nvim_buf_set_option(0, "filetype", "clojure")
  vim.api.nvim_buf_set_lines(0, 0, -1, true, {content})
  return vim.api.nvim_win_set_cursor(0, cursor)
end
local function expect(_3_)
  local _arg_4_ = _3_
  local cursor = _arg_4_["cursor"]
  local content = _arg_4_["content"]
  if content then
    assert.are.same(content, core.first(vim.api.nvim_buf_get_lines(0, 0, -1, false)))
  else
  end
  if cursor then
    return assert.are.same(cursor, vim.api.nvim_win_get_cursor(0))
  else
    return nil
  end
end
return {setup = setup, expect = expect}
