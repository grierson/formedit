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
                  (h.expect {:content "()" :cursor [1 0]})))
            (it :vector
                (fn []
                  (h.setup {:content "[1]" :cursor [1 1]})
                  (h.feedkeys :dif)
                  (h.expect {:content "[]" :cursor [1 1]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 1]})
                  (h.feedkeys :dif)
                  (h.expect {:content "#{}" :cursor [1 1]})))
            (it "anonymous function"
                (fn []
                  (h.setup {:content "#(fn [x] x)" :cursor [1 1]})
                  (h.feedkeys :dif)
                  (h.expect {:content "#()" :cursor [1 1]})))
            (it "delete multiple children"
                (fn []
                  (h.setup {:content "([1] [2])" :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "()" :cursor [1 0]})))))

(describe "delete inside across lines"
          (fn []
            (it :list
                (fn []
                  (h.setup {:content ["(1" "2)"] :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "()" :cursor [1 0]})))
            (it :vector
                (fn []
                  (h.setup {:content ["[1" "2]"] :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "[]" :cursor [1 0]})))
            (it :set
                (fn []
                  (h.setup {:content ["#{1" "2}"] :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "#{}" :cursor [1 0]})))))
