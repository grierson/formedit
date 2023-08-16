(local find (require :formedit.find))
(local ts (require :vim.treesitter))

(fn forward []
  (let [form (find.form)
        [row col] [(form:end_)]
        col (- col 1)
        sibling (form:next_sibling)
        sibling-text (ts.get_node_text sibling 0)
        sibling-text (.. " " sibling-text)
        [sibling-row-start sibling-col-start sibling-row-end sibling-col-end] [(sibling:range)]]
    (vim.api.nvim_buf_set_text 0 sibling-row-start (- sibling-col-start 1)
                               sibling-row-end sibling-col-end [""])
    (vim.api.nvim_buf_set_text 0 row col row col [sibling-text])))

(fn backward []
  (let [form (find.form)
        [row col] [(form:start)]
        type (form:type)
        offset (. find.insert-offset type)
        col (+ col offset)
        sibling (form:prev_sibling)
        sibling-text (ts.get_node_text sibling 0)
        sibling-text (.. sibling-text " ")
        [sibling-row-start sibling-col-start sibling-row-end sibling-col-end] [(sibling:range)]]
    (vim.api.nvim_buf_set_text 0 row col row col [sibling-text])
    (vim.api.nvim_buf_set_text 0 sibling-row-start sibling-col-start
                               sibling-row-end (+ sibling-col-end 1) [""])))

{: forward : backward}
