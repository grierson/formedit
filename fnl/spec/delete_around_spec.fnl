(local {: describe : it} (require :plenary.busted))
(local h (require :spec.helper))
(local selection (require :formedit.selection))

(describe "delete around"
          (fn []
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 1]})
                  (selection.delete-around-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it :vector
                (fn []
                  (h.setup {:content "[1]" :cursor [1 1]})
                  (selection.delete-around-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 1]})
                  (selection.delete-around-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "anonymous function"
                (fn []
                  (h.setup {:content "#(fn [x] x)" :cursor [1 1]})
                  (selection.delete-around-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "delete multiple children"
                (fn []
                  (h.setup {:content "([1] [2])" :cursor [1 0]})
                  (selection.delete-around-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "delete across lines"
                (fn []
                  (h.setup {:content ["([1]" "[2])"] :cursor [1 0]})
                  (selection.delete-around-form)
                  (h.expect {:content "" :cursor [1 0] :lines 1})))))
