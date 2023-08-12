-- [nfnl] Compiled from fnl/formedit/selection.fnl by https://github.com/Olical/nfnl, do not edit.
local tree = require("formedit.tree")
local function get_around_form()
  local form = tree["get-current-form"]()
  return {form:range()}
end
local function get_inner_form()
  local form = tree["get-current-form"]()
  local offset
  if (("set_lit" == form:type()) or ("anon_fn_lit" == form:type())) then
    offset = 2
  else
    offset = 1
  end
  local _let_2_ = {form:range()}
  local start_row = _let_2_[1]
  local start_col = _let_2_[2]
  local end_row = _let_2_[3]
  local end_col = _let_2_[4]
  return {start_row, (start_col + offset), end_row, (end_col - 1)}
end
local function delete_around_form()
  local _let_3_ = get_around_form()
  local start_row = _let_3_[1]
  local start_col = _let_3_[2]
  local end_row = _let_3_[3]
  local end_col = _let_3_[4]
  return vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})
end
local function delete_inner_form()
  local _let_4_ = get_inner_form()
  local start_row = _let_4_[1]
  local start_col = _let_4_[2]
  local end_row = _let_4_[3]
  local end_col = _let_4_[4]
  return vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})
end
return {["get-around-form"] = get_around_form, ["get-inner-form"] = get_inner_form, ["delete-around-form"] = delete_around_form, ["delete-inner-form"] = delete_inner_form}
