(local find (require :formedit.find))

(fn head []
  (let [form (find.form)
        offset (. find.offset (form:type))
        [start-row start-col end-row end-col] [(form:range)]]
    (vim.api.nvim_buf_set_text 0 end-row end-col end-row end-col [")"])
    (vim.api.nvim_buf_set_text 0 start-row start-col start-row start-col ["( "])
    (vim.api.nvim_win_set_cursor 0 [(+ start-row 1) (+ start-col offset)])
    (vim.api.nvim_feedkeys :i :n true)))

{: head}
