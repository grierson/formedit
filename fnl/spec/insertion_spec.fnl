(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local insertion (require :formedit.insertion))

(local head-keymap :<localleader>h)
(local tail-keymap :<localleader>t)

(describe "head insertion"
          (fn []
            (before_each (fn []
                           (set vim.g.maplocalleader ",")
                           (vim.keymap.set :n head-keymap insertion.head)))
            (it :form
                (fn []
                  (h.setup {:content "(1)" :cursor [1 0]})
                  (h.feedkeys head-keymap)
                  (h.expect {:content "( 1)" :cursor [1 0]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 0]})
                  (h.feedkeys head-keymap)
                  (h.expect {:content "#{ 1}" :cursor [1 0]})))
            (it "sub form"
                (fn []
                  (h.setup {:content "(1 (2))" :cursor [1 3]})
                  (h.feedkeys head-keymap)
                  (h.expect {:content "(1 ( 2))" :cursor [1 2]})))))

(describe "tail insertion"
          (fn []
            (before_each (fn []
                           (set vim.g.maplocalleader ",")
                           (vim.keymap.set :n tail-keymap insertion.tail)))
            (it :form
                (fn []
                  (h.setup {:content "(1)" :cursor [1 0]})
                  (h.feedkeys tail-keymap)
                  (h.expect {:content "(1 )" :cursor [1 0]})))
            (it :sub
                (fn []
                  (h.setup {:content "(1 (2))" :cursor [1 4]})
                  (h.feedkeys tail-keymap)
                  (h.expect {:content "(1 (2 ))" :cursor [1 3]})))))
