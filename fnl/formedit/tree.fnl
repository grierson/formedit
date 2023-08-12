(local ts (require :nvim-treesitter.ts_utils))

(local forms {:list_lit true
              :vec_lit true
              :map_lit true
              :set_lit true
              :anon_fn_lit true})

(fn get-form [node]
  (if (. forms (node:type))
      node
      (let [parent (node:parent)]
        (when parent (get-form parent)))))

(fn get-current-form []
  (let [node (ts.get_node_at_cursor)
        form (get-form node)]
    form))

{: get-current-form}
