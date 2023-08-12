(local tree (require :formedit.tree))

(fn delete-around-form []
  (let [form (tree.get-current-form)
        [start-row start-col end-row end-col] [(form:range)]]
    (vim.api.nvim_buf_set_text 0 start-row start-col end-row end-col {})))

(fn delete-inner-form []
  (let [form (tree.get-current-form)
        [start-row start-col end-row end-col] [(form:range)]
        buffer 0
        offset (if (or (= :set_lit (form:type)) (= :anon_fn_lit (form:type)))
                   2
                   1)]
    (vim.api.nvim_buf_set_text buffer start-row (+ start-col offset) end-row
                               (- end-col 1) {})))

{: delete-around-form : delete-inner-form}
