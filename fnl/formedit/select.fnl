(local ts (require :nvim-treesitter.ts_utils))

(local forms {:list_lit true
              :vec_lit true
              :map_lit true
              :set_lit true
              :anon_fn_lit true})

;; Tree search
(fn find-current-form [node]
  (if (. forms (node:type))
      node
      (let [parent (node:parent)]
        (when parent (find-current-form parent)))))

(fn find-root-form [node]
  (if (node:parent)
      (find-root-form (node:parent))
      node))

;; Find node
(fn get-current-form []
  (let [node (ts.get_node_at_cursor)]
    (find-current-form node)))

(fn get-current-root-form []
  (let [node (ts.get_node_at_cursor)]
    (find-root-form node)))

; (fn get-inner-form []
;   (let [form (get-current-form)
;         [open-row open-col] [(: (. (form:field :open) 1) :end_)]
;         [end-row end-col] [(: (. (form:field :close) 1) :start)]]
;     [open-row open-col end-row end-col]))

;; Select node
(fn select-form []
  (let [form (get-current-form)]
    (ts.update_selection 0 form)))

(fn select-root-form []
  (let [form (get-current-root-form)]
    (ts.update_selection 0 form)))

{: get-current-form : select-form : select-root-form}
