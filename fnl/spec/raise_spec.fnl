(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local raise (require :formedit.raise))

(local localleader ",")
(local raise-form-keymap :<localleader>o)
(local raise-element-keymap :<localleader>O)

(describe :raise-form
          (fn []
            (before_each (fn []
                           (set vim.g.maplocalleader localleader)
                           (vim.keymap.set :n raise-form-keymap raise.form)
                           (vim.keymap.set :n raise-element-keymap
                                           raise.element)))
            (it :form
                (fn []
                  (h.setup {:content "(+ 1 (+ 2 3))" :cursor [1 5]})
                  (h.feedkeys raise-form-keymap)
                  (h.expect {:content "(+ 2 3)" :cursor [1 0]})))))

(describe :raise-element
          (fn []
            (before_each (fn []
                           (set vim.g.maplocalleader localleader)
                           (vim.keymap.set :n raise-form-keymap raise.form)
                           (vim.keymap.set :n raise-element-keymap
                                           raise.element)))
            (it :first-element
                (fn []
                  (h.setup {:content "(+ 1 (+ 2 3))" :cursor [1 8]})
                  (h.feedkeys raise-element-keymap)
                  (h.expect {:content "(+ 1 2)" :cursor [1 5]})))
            (it :second-element
                (fn []
                  (h.setup {:content "(+ 1 (+ 2 3))" :cursor [1 10]})
                  (h.feedkeys raise-element-keymap)
                  (h.expect {:content "(+ 1 3)" :cursor [1 5]})))))
