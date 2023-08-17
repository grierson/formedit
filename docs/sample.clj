; TODO: Broken
; barf forward
; cxt: cursor within 1st form
; key: <)
; expected: (+ 1 (+ 2) 3)
(+ 1 (+ 2 3))

; TODO: Broken
; barf backwards
; cxt: cursor within 1st form
; key: >(
; expected: (+ 1 + (2 3))
(+ 1 (+ 2 3))

; Wrap form
; cxt: cursor within
; key: <localleader>i
; expected: (| (+ 2 3)) *insert mode*
(+ 2 3)

; slurp forward
; cxt: cursor within 1st form
; key: >)
; expected: ((+ 1 2 3))
((+ 1 2) 3)

; slurp backward
; cxt: cursor within 1st form
; key: <(
; expected: (+ (1 + 2 3))
(+ 1 (+ 2 3))

; raise form
; cxt: cursor within 1st form
; key: <localleader>o
; expected: (+ 2 3)
(+ 1 (+ 2 3))

; Text object inner
; cxt: cursor within form
; key: dif
; expected: ()
(+ 2 3)

; Text object root inner
; cxt: cursor within second form
; key: diF
; expected: ()
(+ 2 (+ 3))

; Text object outer
; cxt: cursor within second form
; key: daf
; expected: (+ 2 )
(+ 2 (+ 3 4))

; Text object root outer
; cxt: cursor within second form
; key: daF
; expected: _
(+ 2 3)

; Insert head
; cxt: cursor within
; key: <localleader>h
; expected: (| + 2 3) *insert mode*
(+ 2 3)

; Insert tail
; cxt: cursor within
; key: <localleader>H
; expected: (+ 2 3 |) *insert mode*
(+ 2 3)
