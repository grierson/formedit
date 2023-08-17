-- [nfnl] Compiled from fnl/formedit/insertion.fnl by https://github.com/Olical/nfnl, do not edit.
local find = require("formedit.find")
local function head()
  local form = find.form()
  local offset = find.offset[form:type()]
  local _let_1_ = {form:start()}
  local start_row = _let_1_[1]
  local start_col = _let_1_[2]
  local start_col0 = (start_col + offset)
  vim.api.nvim_buf_set_text(0, start_row, start_col0, start_row, start_col0, {" "})
  vim.api.nvim_win_set_cursor(0, {(start_row + 1), (start_col0 + 1)})
  return vim.api.nvim_feedkeys("i", "n", true)
end
local function tail()
  local form = find.form()
  local _let_2_ = {form:end_()}
  local end_row = _let_2_[1]
  local end_col = _let_2_[2]
  local end_col0 = (end_col - 1)
  vim.api.nvim_buf_set_text(0, end_row, end_col0, end_row, end_col0, {" "})
  return vim.api.nvim_feedkeys("i", "n", true)
end
return {head = head, tail = tail}
