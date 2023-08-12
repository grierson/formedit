(local tree (require :formedit.tree))
(local ts (require :nvim-treesitter.ts_utils))

(fn delete-form []
  (let [node (ts.get_node_at_cursor)
        form (tree.get-form node)
        [start-row start-col end-row end-col] [(form:range)]]
    (vim.api.nvim_buf_set_text 0 start-row start-col end-row end-col {})))

{: delete-form}
