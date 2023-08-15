(local ts (require :nvim-treesitter.ts_utils))
(local find (require :formedit.find))

(fn form []
  (let [form (find.form)]
    (ts.update_selection 0 form)))

(fn root []
  (let [form (find.root)]
    (ts.update_selection 0 form)))

{: form : root}
