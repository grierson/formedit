(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local wrap (require :formedit.wrap))

(local keymap :<localleader>i)

(describe :wrap
          (fn []
            (before_each (fn []
                           (set vim.g.maplocalleader keymap)
                           (vim.keymap.set :n keymap wrap.head)))
            (it "form head"
                (fn []
                  (h.setup {:content "(1)" :cursor [1 0]})
                  (h.feedkeys keymap)
                  (h.expect {:content "( (1))" :cursor [1 0]})))
            (it "sub form"
                (fn []
                  (h.setup {:content "(1 (2))" :cursor [1 4]})
                  (h.feedkeys keymap)
                  (h.expect {:content "(1 ( (2)))" :cursor [1 3]})))))

(print :foo)
