[(list_lit)
(quoting_lit)
(vec_lit)
(set_lit)
(anon_fn_lit)
(map_lit)] @form.outer

; -- Works: Get List start and end
; (list_lit . value: (_) @_start value: (_) @end .)

; -- Works: Get Vector start and end
; (vec*lit . value: (_) @_start value: (_) @end .)

; -- Works: List inner range
; ((list_lit . value: (_) @_start value: (_) @end .)
; (#make-range! "form.inner" @start @end))

; -- Works: Vector inner range
; ((vec_lit . value: (_) @_start value: (_) @end .)
; (#make-range! "form.inner" @start @end))

; -- Fails: List or Vector inner start and end
; ([list_lit vec_lit] . value: (_) @start value: (_) @end .)

; -- Fails: List or Vector inner range
; (([list_lit vec_lit] . value: (_) @start value: (_) @end .)
; (#make-range! "form.inner" @start @end))

@start
@end
