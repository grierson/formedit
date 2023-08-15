(local find (require :formedit.find))

(fn range [form]
  (let [[start-row start-col end-row end-col] [(form:range)]]
    [(+ start-row 1) start-col (+ end-row 1) end-col]))

(fn head []
  (let [form (find.form)
        insert-offset (. find.insert-offset (form:type))
        [start-row start-col end-row end-col] (range form)]
    (vim.api.nvim_win_set_cursor 0 [end-row end-col])
    (vim.api.nvim_command "normal! i)")
    (vim.api.nvim_win_set_cursor 0 [start-row start-col])
    (vim.api.nvim_command "normal! i( ")
    (vim.api.nvim_win_set_cursor 0 [start-row (+ start-col insert-offset)])
    (vim.api.nvim_feedkeys :i :n true)))

{: head}
