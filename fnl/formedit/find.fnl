(local ts (require :nvim-treesitter.ts_utils))

(local forms {:list_lit true
              :vec_lit true
              :map_lit true
              :set_lit true
              :anon_fn_lit true})

(local offset {:list_lit 1 :vec_lit 1 :map_lit 1 :set_lit 2 :anon_fn_lit 2})

;; Tree search
(fn find-current-form [node]
  (if (. forms (node:type))
      node
      (let [parent (node:parent)]
        (when parent (find-current-form parent)))))

(fn find-root-form [node]
  (let [[_ col] [(node:start)]
        type (node:type)]
    (if (and (. forms type) (= col 0))
        node
        (when (node:parent)
          (find-root-form (node:parent))))))

(fn first [form]
  (form:named_child 0))

(fn last [form]
  (let [count (form:named_child_count)]
    (form:child count)))

;; Find node
(fn form []
  (let [node (ts.get_node_at_cursor)]
    (find-current-form node)))

(fn root []
  (let [node (ts.get_node_at_cursor)]
    (find-root-form node)))

{: form : root : offset : first : last}
