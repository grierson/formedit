(local {: describe : it} (require :plenary.busted))
(local h (require :spec.nfnl.helper))
(local tree (require :formedit.tree))
(local assert (require :luassert.assert))
(local ts (require :nvim-treesitter.ts_utils))

(describe "node under cursor"
          (fn []
            (it "cursor on start of form"
                (fn []
                  (h.setup {:content "(a)" :cursor [1 2]})
                  (let [node (ts.get_node_at_cursor)
                        actual (tree.form? node)]
                    (assert.equals :list_lit (actual:type)))))))
