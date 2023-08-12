-- [nfnl] Compiled from fnl/formedit/selection.fnl by https://github.com/Olical/nfnl, do not edit.
local tree = require("formedit.tree")
local ts = require("nvim-treesitter.ts_utils")
local function delete_around_form()
  local node = ts.get_node_at_cursor()
  local form = tree["get-form"](node)
  local _let_1_ = {form:range()}
  local start_row = _let_1_[1]
  local start_col = _let_1_[2]
  local end_row = _let_1_[3]
  local end_col = _let_1_[4]
  return vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})
end
local function delete_inner_form(node)
  local node0 = ts.get_node_at_cursor()
  local form = tree["get-form"](node0)
  local _let_2_ = {form:range()}
  local start_row = _let_2_[1]
  local start_col = _let_2_[2]
  local end_row = _let_2_[3]
  local end_col = _let_2_[4]
  local offset
  if (("set_lit" == form:type()) or ("anon_fn_lit" == form:type())) then
    offset = 2
  else
    offset = 1
  end
  return vim.api.nvim_buf_set_text(0, start_row, (start_col + offset), end_row, (end_col - 1), {})
end
return {["delete-around-form"] = delete_around_form, ["delete-inner-form"] = delete_inner_form}
