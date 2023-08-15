-- [nfnl] Compiled from fnl/formedit/wrap.fnl by https://github.com/Olical/nfnl, do not edit.
local find = require("formedit.find")
local function head()
  local form = find.form()
  local insert_offset = (find["insert-offset"])[form:type()]
  local _let_1_ = {form:range()}
  local start_row = _let_1_[1]
  local start_col = _let_1_[2]
  local end_row = _let_1_[3]
  local end_col = _let_1_[4]
  vim.api.nvim_buf_set_text(0, end_row, end_col, end_row, end_col, {")"})
  vim.api.nvim_buf_set_text(0, start_row, start_col, start_row, start_col, {"( "})
  vim.api.nvim_win_set_cursor(0, {(start_row + 1), (start_col + insert_offset + 1)})
  return vim.api.nvim_feedkeys("i", "n", true)
end
return {head = head}
