(local {: describe : it} (require :plenary.busted))
(local h (require :spec.helper))
(local tree (require :formedit.tree))
(local assert (require :luassert.assert))
(local ts (require :nvim-treesitter.ts_utils))

(describe :selection
          (fn []
            (it :list
                (fn []
                  (h.setup {:content "(a)" :cursor [1 1]})
                  (let [node (ts.get_node_at_cursor)
                        form (tree.get-form node)]
                    (assert.are.same [0 0 0 3] [(form:range)]))))))
