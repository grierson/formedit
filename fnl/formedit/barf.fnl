(local find (require :formedit.find))
(local ts (require :vim.treesitter))

(fn forward []
  (let [form (find.form)
        last (find.last form)
        [row col] [(form:end_)]
        [last-row-start last-col-start last-row-end last-col-end] [(last:range)]
        text (ts.get_node_text last 0)
        text (.. " " text)]
    (vim.api.nvim_buf_set_text 0 row col row col [text])
    (vim.api.nvim_buf_set_text 0 last-row-start (- last-col-start 1)
                               last-row-end last-col-end [""])))

(fn backward []
  (let [form (find.form)
        first (find.first form)
        text (ts.get_node_text first 0)
        text (.. text " ")
        [row-start col-start row-end col-end] [(first:range)]
        _ (vim.api.nvim_buf_set_text 0 row-start col-start row-end
                                     (+ col-end 1) [""])
        nform (find.form)
        [nrow-start ncol-start] [(nform:start)]]
    (vim.api.nvim_buf_set_text 0 nrow-start ncol-start nrow-start ncol-start
                               [text])))

{: forward : backward}
