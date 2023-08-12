(local {: describe : it} (require :plenary.busted))
(local h (require :spec.helper))
(local tree (require :formedit.tree))
(local assert (require :luassert.assert))

(describe :selection
          (fn []
            (it :list
                (fn []
                  (h.setup {:content "(a)" :cursor [1 1]})
                  (let [form (tree.get-current-form)]
                    (assert.are.same [0 0 0 3] [(form:range)]))))))
