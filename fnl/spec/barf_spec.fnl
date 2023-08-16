(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local barf (require :formedit.barf))

(local forward-keymap "<)")
(local backward-keymap ">(")

(describe "barf forward"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :n forward-keymap barf.forward)))
            (it :element
                (fn []
                  (h.setup {:content "((1 2))" :cursor [1 1]})
                  (h.feedkeys forward-keymap)
                  (h.expect {:content "((1) 2)" :cursor [1 1]})))
            (it :form
                (fn []
                  (h.setup {:content "(((1) (2)))" :cursor [1 1]})
                  (h.feedkeys forward-keymap)
                  (h.expect {:content "(((1)) (2))" :cursor [1 1]})))))

(describe "barf backwards"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :n backward-keymap barf.backward)))
            (it :element
                (fn []
                  (h.setup {:content "((1 2))" :cursor [1 1]})
                  (h.feedkeys backward-keymap)
                  (h.expect {:content "(1 (2))" :cursor [1 1]})))
            (it :form
                (fn []
                  (h.setup {:content "(((1) 2))" :cursor [1 1]})
                  (h.feedkeys backward-keymap)
                  (h.expect {:content "((1) (2))" :cursor [1 1]})))))
