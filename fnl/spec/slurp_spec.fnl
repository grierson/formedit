(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local slurp (require :formedit.slurp))

(local forward-keymap ">)")
(local backward-keymap "<(")

(describe "slurp forward"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :n forward-keymap slurp.forward)))
            (it :element
                (fn []
                  (h.setup {:content "((1) 2)" :cursor [1 1]})
                  (h.feedkeys forward-keymap)
                  (h.expect {:content "((1 2))" :cursor [1 1]})))
            (it :form
                (fn []
                  (h.setup {:content "((1) (+ 2 3))" :cursor [1 1]})
                  (h.feedkeys forward-keymap)
                  (h.expect {:content "((1 (+ 2 3)))" :cursor [1 1]})))
            (it :set
                (fn []
                  (h.setup {:content "(#{1} 2)" :cursor [1 1]})
                  (h.feedkeys forward-keymap)
                  (h.expect {:content "(#{1 2})" :cursor [1 1]})))))


(describe "slurp backwards"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :n backward-keymap slurp.backward)))
            (it :element
                (fn []
                  (h.setup {:content "(1 (2))" :cursor [1 3]})
                  (h.feedkeys backward-keymap)
                  (h.expect {:content "((1 2))" :cursor [1 3]})))
            (it :form
                (fn []
                  (h.setup {:content "((1) (+ 2 3))" :cursor [1 5]})
                  (h.feedkeys backward-keymap)
                  (h.expect {:content "(((1) + 2 3))" :cursor [1 5]})))
            (it :set
                (fn []
                  (h.setup {:content "(1 #{2})" :cursor [1 3]})
                  (h.feedkeys backward-keymap)
                  (h.expect {:content "(#{1 2})" :cursor [1 3]})))))
