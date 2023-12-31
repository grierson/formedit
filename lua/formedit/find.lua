-- [nfnl] Compiled from fnl/formedit/find.fnl by https://github.com/Olical/nfnl, do not edit.
local ts = require("nvim-treesitter.ts_utils")
local forms = {list_lit = true, vec_lit = true, map_lit = true, set_lit = true, anon_fn_lit = true}
local offset = {list_lit = 1, vec_lit = 1, map_lit = 1, set_lit = 2, anon_fn_lit = 2}
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
  local _let_3_ = {node:start()}
  local _ = _let_3_[1]
  local col = _let_3_[2]
  local type = node:type()
  if (forms[type] and (col == 0)) then
    return node
  else
    if node:parent() then
      return find_root_form(node:parent())
    else
      return nil
    end
  end
end
local function first(form)
  return form:named_child(0)
end
local function last(form)
  local count = form:named_child_count()
  return form:child(count)
end
local function element()
  return ts.get_node_at_cursor()
end
local function form()
  local node = ts.get_node_at_cursor()
  return find_current_form(node)
end
local function root()
  local node = ts.get_node_at_cursor()
  return find_root_form(node)
end
return {form = form, root = root, offset = offset, first = first, last = last, element = element}
