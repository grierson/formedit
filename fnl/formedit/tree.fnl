(local forms {:list_lit true
              :vec_lit true
              :map_lit true
              :set_lit true
              :anon_fn_lit true})

(fn form? [node]
  (if (. forms (node:type))
      node
      (let [child (node:named_child 0)]
        (when child (form? child)))))

{: form?}
