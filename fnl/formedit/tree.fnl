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

{: get-form}
