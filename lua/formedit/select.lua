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
return {form = form, root = root}
