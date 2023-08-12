-- [nfnl] Compiled from fnl/formedit/tree.fnl by https://github.com/Olical/nfnl, do not edit.
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
return {["get-form"] = get_form}
