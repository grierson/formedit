-- [nfnl] Compiled from fnl/formedit/slurp.fnl by https://github.com/Olical/nfnl, do not edit.
local find = require("formedit.find")
local ts = require("vim.treesitter")
local function forward()
  local form = find.form()
  local _let_1_ = {form:end_()}
  local row = _let_1_[1]
  local col = _let_1_[2]
  local col0 = (col - 1)
  local sibling = form:next_sibling()
  local sibling_text = ts.get_node_text(sibling, 0)
  local sibling_text0 = (" " .. sibling_text)
  local _let_2_ = {sibling:range()}
  local sibling_row_start = _let_2_[1]
  local sibling_col_start = _let_2_[2]
  local sibling_row_end = _let_2_[3]
  local sibling_col_end = _let_2_[4]
  vim.api.nvim_buf_set_text(0, sibling_row_start, (sibling_col_start - 1), sibling_row_end, sibling_col_end, {""})
  return vim.api.nvim_buf_set_text(0, row, col0, row, col0, {sibling_text0})
end
local function backward()
  local form = find.form()
  local _let_3_ = {form:start()}
  local row = _let_3_[1]
  local col = _let_3_[2]
  local type = form:type()
  local offset = (find["insert-offset"])[type]
  local col0 = (col + offset)
  local sibling = form:prev_sibling()
  local sibling_text = ts.get_node_text(sibling, 0)
  local sibling_text0 = (sibling_text .. " ")
  local _let_4_ = {sibling:range()}
  local sibling_row_start = _let_4_[1]
  local sibling_col_start = _let_4_[2]
  local sibling_row_end = _let_4_[3]
  local sibling_col_end = _let_4_[4]
  vim.api.nvim_buf_set_text(0, row, col0, row, col0, {sibling_text0})
  return vim.api.nvim_buf_set_text(0, sibling_row_start, sibling_col_start, sibling_row_end, (sibling_col_end + 1), {""})
end
return {forward = forward, backward = backward}
