(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local raise (require :formedit.raise))

(local keymap :<localleader>o)

(describe :raise
          (fn []
            (before_each (fn []
                           (set vim.g.maplocalleader keymap)
                           (vim.keymap.set :n keymap raise.form)))
            (it :form
                (fn []
                  (h.setup {:content "(1 (2))" :cursor [1 4]})
                  (h.feedkeys keymap)
                  (h.expect {:content "(2)" :cursor [1 2]})))))
