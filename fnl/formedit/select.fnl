(local ts (require :nvim-treesitter.ts_utils))
(local find (require :formedit.find))

(fn form []
  (let [form (find.form)]
    (ts.update_selection 0 form)))

(fn root []
  (let [form (find.root)]
    (ts.update_selection 0 form)))

(fn inner-select [form]
  (let [[start-row start-col end-row end-col] [(form:range)]
        type (form:type)
        offset (. find.offset type)]
    (vim.api.nvim_win_set_cursor 0 [(+ start-row 1) (+ start-col offset)])
    (vim.api.nvim_command "normal! v")
    (vim.api.nvim_win_set_cursor 0 [(+ end-row 1) (- end-col 2)])))

(fn inner []
  (let [form (find.form)]
    (inner-select form)))

(fn inner-root []
  (let [form (find.root)]
    (inner-select form)))

{: form : root : inner : inner-root}
