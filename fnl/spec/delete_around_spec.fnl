(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local select (require :formedit.select))

(describe "delete around"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :o :af select.select-form)))
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 1]})
                  (h.feedkeys :daf)
                  (h.expect {:content "" :cursor [1 0]})))
            (it :vector
                (fn []
                  (h.setup {:content "[1]" :cursor [1 1]})
                  (h.feedkeys :daf)
                  (h.expect {:content "" :cursor [1 0]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 1]})
                  (h.feedkeys :daf)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "anonymous function"
                (fn []
                  (h.setup {:content "#(fn [x] x)" :cursor [1 1]})
                  (h.feedkeys :daf)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "delete multiple children"
                (fn []
                  (h.setup {:content "([1] [2])" :cursor [1 0]})
                  (h.feedkeys :daf)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "delete across lines"
                (fn []
                  (h.setup {:content ["([1]" "[2])"] :cursor [1 0]})
                  (h.feedkeys :daf)
                  (h.expect {:content "" :cursor [1 0] :lines 1})))))
