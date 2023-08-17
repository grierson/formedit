-- [nfnl] Compiled from fnl/formedit/select.fnl by https://github.com/Olical/nfnl, do not edit.
local ts = require("nvim-treesitter.ts_utils")
local find = require("formedit.find")
local function form()
  local form0 = find.form()
  return ts.update_selection(0, form0)
end
local function root()
  local form0 = find.root()
  return ts.update_selection(0, form0)
end
local function inner_select(form0)
  local _let_1_ = {form0:range()}
  local start_row = _let_1_[1]
  local start_col = _let_1_[2]
  local end_row = _let_1_[3]
  local end_col = _let_1_[4]
  local type = form0:type()
  local offset = find.offset[type]
  vim.api.nvim_win_set_cursor(0, {(start_row + 1), (start_col + offset)})
  vim.api.nvim_command("normal! v")
  return vim.api.nvim_win_set_cursor(0, {(end_row + 1), (end_col - 2)})
end
local function inner()
  local form0 = find.form()
  return inner_select(form0)
end
local function inner_root()
  local form0 = find.root()
  return inner_select(form0)
end
return {form = form, root = root, inner = inner, ["inner-root"] = inner_root}
