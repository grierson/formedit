(local tree (require :formedit.tree))

(fn get-around-form []
  (let [form (tree.get-current-form)]
    [(form:range)]))

(fn get-inner-form []
  (let [form (tree.get-current-form)
        offset (if (or (= :set_lit (form:type)) (= :anon_fn_lit (form:type)))
                   2
                   1)
        [start-row start-col end-row end-col] [(form:range)]]
    [start-row (+ start-col offset) end-row (- end-col 1)]))

(fn delete-around-form []
  (let [[start-row start-col end-row end-col] (get-around-form)]
    (vim.api.nvim_buf_set_text 0 start-row start-col end-row end-col {})))

(fn delete-inner-form []
  (let [[start-row start-col end-row end-col] (get-inner-form)]
    (vim.api.nvim_buf_set_text 0 start-row start-col end-row end-col {})))

{: get-around-form : get-inner-form : delete-around-form : delete-inner-form}
