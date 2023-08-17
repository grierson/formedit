(local find (require :formedit.find))

(fn head []
  (let [form (find.form)
        offset (. find.offset (form:type))
        [start-row start-col] [(form:start)]
        start-col (+ start-col offset)]
    (vim.api.nvim_buf_set_text 0 start-row start-col start-row start-col [" "])
    (vim.api.nvim_win_set_cursor 0 [(+ start-row 1) start-col])
    (vim.api.nvim_feedkeys :i :n true)))

(fn tail []
  (let [form (find.form)
        [end-row end-col] [(form:end_)]
        end-col (- end-col 1)]
    (vim.api.nvim_buf_set_text 0 end-row end-col end-row end-col [" "])
    (vim.api.nvim_win_set_cursor 0 [(+ end-row 1) end-row])
    (vim.api.nvim_feedkeys :i :n true)))

{: head : tail}
