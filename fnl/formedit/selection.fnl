(local tree (require :formedit.tree))
(local ts (require :nvim-treesitter.ts_utils))

(fn delete-around-form []
  (let [node (ts.get_node_at_cursor)
        form (tree.get-form node)
        [start-row start-col end-row end-col] [(form:range)]]
    (vim.api.nvim_buf_set_text 0 start-row start-col end-row end-col {})))

(fn delete-inner-form [node]
  (let [node (ts.get_node_at_cursor)
        form (tree.get-form node)
        [start-row start-col end-row end-col] [(form:range)]
        text (vim.api.nvim_buf_get_text 0 start-row start-col end-row end-col
                                        {})
        _ (print "Inner form text")
        _ (print (vim.inspect text))
        _ (print :range)
        _ (print (vim.inspect [(form:range)]))
        offset (if (or (= :set_lit (form:type)) (= :anon_fn_lit (form:type)))
                   2
                   1)]
    (vim.api.nvim_buf_set_text 0 start-row (+ start-col offset) end-row
                               (- end-col 1) {})))

{: delete-around-form : delete-inner-form}
