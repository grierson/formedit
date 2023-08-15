(local find (require :formedit.find))
(local ts (require :vim.treesitter))

(fn form []
  (let [form (find.form)
        parent (form:parent)
        text (ts.get_node_text form 0)
        [start-row start-col end-row end-col] [(parent:range)]]
    (vim.api.nvim_buf_set_text 0 start-row start-col end-row end-col [text])))

{: form}
