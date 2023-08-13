(local {: describe : it} (require :plenary.busted))
(local h (require :spec.helper))
(local tree (require :formedit.tree))
(local assert (require :luassert.assert))

(describe "No form return nil"
          (fn []
            (it "cursor start of form"
                (fn []
                  (h.setup {:content " " :cursor [1 1]})
                  (let [actual (tree.get-current-form)]
                    (assert.falsy actual))))))

(describe :List
          (let [form-type :list_lit]
            (fn []
              (it "cursor start of form"
                  (fn []
                    (h.setup {:content "(a)" :cursor [1 1]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor within form"
                  (fn []
                    (h.setup {:content "(a)" :cursor [1 2]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor end of form"
                  (fn []
                    (h.setup {:content "(a)" :cursor [1 3]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type))))))))

(describe :Vector
          (let [form-type :vec_lit]
            (fn []
              (it "cursor start of form"
                  (fn []
                    (h.setup {:content "[a]" :cursor [1 1]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor within form"
                  (fn []
                    (h.setup {:content "[a]" :cursor [1 2]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor end of form"
                  (fn []
                    (h.setup {:content "[a]" :cursor [1 3]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type))))))))

(describe :Map
          (let [form-type :map_lit]
            (fn []
              (it "cursor start of form"
                  (fn []
                    (h.setup {:content "{:a 1}" :cursor [1 1]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor within form"
                  (fn []
                    (h.setup {:content "{:a 1}" :cursor [1 2]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor end of form"
                  (fn []
                    (h.setup {:content "{:a 1}" :cursor [1 6]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type))))))))

(describe :Set
          (let [form-type :set_lit]
            (fn []
              (it "cursor on #"
                  (fn []
                    (h.setup {:content "#{1}" :cursor [1 1]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor start of form"
                  (fn []
                    (h.setup {:content "#{1}" :cursor [1 2]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor within form"
                  (fn []
                    (h.setup {:content "#{1}" :cursor [1 3]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor end of form"
                  (fn []
                    (h.setup {:content "#{1}" :cursor [1 4]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type))))))))

(describe "Anonymous function"
          (let [form-type :anon_fn_lit]
            (fn []
              (it "cursor on #"
                  (fn []
                    (h.setup {:content "#(1)" :cursor [1 1]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor start of form"
                  (fn []
                    (h.setup {:content "#(1)" :cursor [1 2]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor within form"
                  (fn []
                    (h.setup {:content "#(1)" :cursor [1 3]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type)))))
              (it "cursor end of form"
                  (fn []
                    (h.setup {:content "#(1)" :cursor [1 4]})
                    (let [actual (tree.get-current-form)]
                      (assert.equals form-type (actual:type))))))))
