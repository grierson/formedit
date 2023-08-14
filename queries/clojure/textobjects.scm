[(list_lit)
 (quoting_lit)
 (vec_lit)
 (set_lit)
 (anon_fn_lit)
 (map_lit)] @form.outer

; ((list_lit . value: (_) @_start value: (_) @_end .)
;  (#make-range! "form.inner" @_start @_end))

((vec_lit . value: (_) @_start value: (_) @_end .)
 (#make-range! "form.inner" @_start @_end))

; -- Fails: List or Vector inner range
; (([list_lit vec_lit] . value: (_) @start value: (_) @end .)
; (#make-range! "form.inner" @start @end))
