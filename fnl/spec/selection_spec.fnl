(local {: describe : it} (require :plenary.busted))
(local h (require :spec.helper))
(local tree (require :formedit.tree))
(local assert (require :luassert.assert))
(local selection (require :formedit.selection))
(local ts (require :nvim-treesitter.ts_utils))

(describe :selection
          (fn []
            (it :list
                (fn []
                  (h.setup {:content "(a)" :cursor [1 1]})
                  (let [node (ts.get_node_at_cursor)
                        form (tree.get-form node)]
                    (assert.are.same [0 0 0 3] [(form:range)]))))))

(describe "delete around"
          (fn []
            (it :list
                (fn []
                  (h.setup {:content "(1)" :cursor [1 1]})
                  (selection.delete-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it :vector
                (fn []
                  (h.setup {:content "[1]" :cursor [1 1]})
                  (selection.delete-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it :set
                (fn []
                  (h.setup {:content "#{1}" :cursor [1 1]})
                  (selection.delete-form)
                  (h.expect {:content "" :cursor [1 0]})))
            (it "anonymous function"
                (fn []
                  (h.setup {:content "#(fn [x] x)" :cursor [1 1]})
                  (selection.delete-form)
                  (h.expect {:content "" :cursor [1 0]})))))
