-- [nfnl] Compiled from fnl/formedit/tree.fnl by https://github.com/Olical/nfnl, do not edit.
local ts = require("nvim-treesitter.ts_utils")
local forms = {list_lit = true, vec_lit = true, map_lit = true, set_lit = true, anon_fn_lit = true}
local function get_form(node)
  if forms[node:type()] then
    return node
  else
    local parent = node:parent()
    if parent then
      return get_form(parent)
    else
      return nil
    end
  end
end
local function get_current_form()
  local node = ts.get_node_at_cursor()
  local form = get_form(node)
  return form
end
local function select_form()
  local form = get_current_form()
  return ts.update_selection(0, form)
end
return {["get-current-form"] = get_current_form, ["select-form"] = select_form}
