(local {: describe : it : before_each} (require :plenary.busted))
(local h (require :spec.helper))
(local select (require :formedit.select))

(describe "delete inner form"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :o :if select.inner)))
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "()" :cursor [1 1]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 0]})
                  (h.feedkeys :dif)
                  (h.expect {:content "#{}" :cursor [1 2]})))))

(describe "delete inner root form"
          (fn []
            (before_each (fn []
                           (vim.keymap.set :o :iF select.inner-root)))
            (it "within first node"
                (fn []
                  (h.setup {:content "([1] 2)" :cursor [1 1]})
                  (h.feedkeys :diF)
                  (h.expect {:content "()" :cursor [1 1]})))
            (it "within second node"
                (fn []
                  (h.setup {:content "(1 [2])" :cursor [1 3]})
                  (h.feedkeys :diF)
                  (h.expect {:content "()" :cursor [1 1]})))))
