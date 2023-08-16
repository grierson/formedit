-- [nfnl] Compiled from fnl/formedit/barf.fnl by https://github.com/Olical/nfnl, do not edit.
local find = require("formedit.find")
local ts = require("vim.treesitter")
local function forward()
  local form = find.form()
  local last = find.last(form)
  local _let_1_ = {form:end_()}
  local row = _let_1_[1]
  local col = _let_1_[2]
  local _let_2_ = {last:range()}
  local last_row_start = _let_2_[1]
  local last_col_start = _let_2_[2]
  local last_row_end = _let_2_[3]
  local last_col_end = _let_2_[4]
  local text = ts.get_node_text(last, 0)
  local text0 = (" " .. text)
  vim.api.nvim_buf_set_text(0, row, col, row, col, {text0})
  return vim.api.nvim_buf_set_text(0, last_row_start, (last_col_start - 1), last_row_end, last_col_end, {""})
end
local function backward()
  local form = find.form()
  local first = find.first(form)
  local text = ts.get_node_text(first, 0)
  local text0 = (text .. " ")
  local _let_3_ = {first:range()}
  local row_start = _let_3_[1]
  local col_start = _let_3_[2]
  local row_end = _let_3_[3]
  local col_end = _let_3_[4]
  local _ = vim.api.nvim_buf_set_text(0, row_start, col_start, row_end, (col_end + 1), {""})
  local nform = find.form()
  local _let_4_ = {nform:start()}
  local nrow_start = _let_4_[1]
  local ncol_start = _let_4_[2]
  return vim.api.nvim_buf_set_text(0, nrow_start, ncol_start, nrow_start, ncol_start, {text0})
end
return {forward = forward, backward = backward}
