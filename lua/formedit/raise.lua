-- [nfnl] Compiled from fnl/formedit/raise.fnl by https://github.com/Olical/nfnl, do not edit.
local find = require("formedit.find")
local ts = require("vim.treesitter")
local function form()
  local form0 = find.form()
  local parent = form0:parent()
  local text = ts.get_node_text(form0, 0)
  local _let_1_ = {parent:range()}
  local start_row = _let_1_[1]
  local start_col = _let_1_[2]
  local end_row = _let_1_[3]
  local end_col = _let_1_[4]
  return vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {text})
end
return {form = form}
