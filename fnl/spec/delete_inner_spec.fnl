(local {: describe : it} (require :plenary.busted))
(local h (require :spec.helper))
(local selection (require :formedit.selection))

(describe "delete inner"
          (fn []
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 1]})
                  (selection.delete-inner-form)
                  (h.expect {:content "()" :cursor [1 1]})))
            (it :vector
                (fn []
                  (h.setup {:content "[1]" :cursor [1 1]})
                  (selection.delete-inner-form)
                  (h.expect {:content "[]" :cursor [1 1]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 1]})
                  (selection.delete-inner-form)
                  (h.expect {:content "#{}" :cursor [1 1]})))
            (it "anonymous function"
                (fn []
                  (h.setup {:content "#(fn [x] x)" :cursor [1 1]})
                  (selection.delete-inner-form)
                  (h.expect {:content "#()" :cursor [1 1]})))
            (it "delete multiple children"
                (fn []
                  (h.setup {:content "([1] [2])" :cursor [1 0]})
                  (selection.delete-inner-form)
                  (h.expect {:content "()" :cursor [1 0]})))
            (it "delete across lines"
                (fn []
                  (h.setup {:content ["([1]," "[2])"] :cursor [1 0]})
                  (selection.delete-inner-form)
                  (h.expect {:content "()" :cursor [1 0] :lines 2})))))
