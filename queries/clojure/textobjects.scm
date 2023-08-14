([(list_lit)
 (quoting_lit)
 (vec_lit)
 (set_lit)
 (anon_fn_lit)
 (map_lit)] @form.outer)


((list_lit . value: (_) @_start value: (_) @_end .)
 (#make-range! "form.inner" @_start @_end))
