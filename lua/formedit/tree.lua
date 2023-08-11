-- [nfnl] Compiled from fnl/formedit/tree.fnl by https://github.com/Olical/nfnl, do not edit.
local forms = {list_lit = true, vec_lit = true, map_lit = true, set_lit = true, anon_fn_lit = true}
local function form_3f(node)
  if forms[node:type()] then
    return node
  else
    local child = node:named_child(0)
    if child then
      return form_3f(child)
    else
      return nil
    end
  end
end
return {["form?"] = form_3f}
