-- [nfnl] Compiled from fnl/spec/helper.fnl by https://github.com/Olical/nfnl, do not edit.
local assert = require("luassert.assert")
local core = require("formedit.nfnl.core")
local function setup(_1_)
  local _arg_2_ = _1_
  local cursor = _arg_2_["cursor"]
  local content = _arg_2_["content"]
  local content0
  if (type(content) == "string") then
    content0 = {content}
  else
    content0 = content
  end
  vim.api.nvim_buf_set_option(0, "filetype", "clojure")
  vim.api.nvim_buf_set_lines(0, 0, -1, true, content0)
  vim.api.nvim_win_set_cursor(0, cursor)
  return vim.treesitter.get_parser(0):parse()
end
local function expect(_4_)
  local _arg_5_ = _4_
  local cursor = _arg_5_["cursor"]
  local content = _arg_5_["content"]
  if content then
    assert.are.same(content, core.first(vim.api.nvim_buf_get_lines(0, 0, 10, false)))
  else
  end
  if cursor then
    return assert.are.same(cursor, vim.api.nvim_win_get_cursor(0))
  else
    return nil
  end
end
return {setup = setup, expect = expect}
