-- [nfnl] Compiled from fnl/formedit/select.fnl by https://github.com/Olical/nfnl, do not edit.
local ts = require("nvim-treesitter.ts_utils")
local forms = {list_lit = true, vec_lit = true, map_lit = true, set_lit = true, anon_fn_lit = true}
local function find_current_form(node)
  if forms[node:type()] then
    return node
  else
    local parent = node:parent()
    if parent then
      return find_current_form(parent)
    else
      return nil
    end
  end
end
local function find_root_form(node)
  if node:parent() then
    return find_root_form(node:parent())
  else
    return node
  end
end
local function get_current_form()
  local node = ts.get_node_at_cursor()
  return find_current_form(node)
end
local function get_current_root_form()
  local node = ts.get_node_at_cursor()
  return find_root_form(node)
end
local function select_form()
  local form = get_current_form()
  return ts.update_selection(0, form)
end
local function select_root_form()
  local form = get_current_root_form()
  return ts.update_selection(0, form)
end
return {["get-current-form"] = get_current_form, ["select-form"] = select_form, ["select-root-form"] = select_root_form}
