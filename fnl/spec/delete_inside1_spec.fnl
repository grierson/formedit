(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local tree (require :formedit.tree))

(describe "delete inside"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :o :if tree.select-form)))
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "()" :cursor [1 0]})))))
