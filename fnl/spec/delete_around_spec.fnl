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
                  (h.expect {:content "" :cursor [1 0] :lines 1})))
            (it "only deletes sub form"
                (fn []
                  (h.setup {:content "([1] [2])" :cursor [1 5]})
                  (h.feedkeys :daf)
                  (h.expect {:content "([1] )" :cursor [1 5]})))))

(describe "delete around root"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :o :aF select.select-root-form)))
            (it "cursor at head of form deletes root"
                (fn []
                  (h.setup {:content "(+ 1 (+ 2 3))" :cursor [1 0]})
                  (h.feedkeys :daF)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "cursor in sub form deletes root"
                (fn []
                  (h.setup {:content "(+ 1 (+ 2 3))" :cursor [1 7]})
                  (h.feedkeys :daF)
                  (h.expect {:content "" :cursor [1 0]})))))
