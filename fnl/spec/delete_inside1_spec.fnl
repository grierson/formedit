(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local select (require :formedit.select))

(describe "delete inside"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :o :if select.select-form)))
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "()" :cursor [1 0]})))))
