-- [nfnl] Compiled from fnl/formedit/selection.fnl by https://github.com/Olical/nfnl, do not edit.
local tree = require("formedit.tree")
local ts = require("nvim-treesitter.ts_utils")
local function delete_form()
  local node = ts.get_node_at_cursor()
  local form = tree["get-form"](node)
  local _let_1_ = {form:range()}
  local start_row = _let_1_[1]
  local start_col = _let_1_[2]
  local end_row = _let_1_[3]
  local end_col = _let_1_[4]
  return vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {})
end
return {["delete-form"] = delete_form}
