(local assert (require :luassert.assert))
(local core (require :formedit.nfnl.core))

(fn setup [{: cursor : content}]
  (let [content (if (= (type content) :string)
                    [content]
                    content)]
    (vim.api.nvim_buf_set_option 0 :filetype :clojure)
    (vim.api.nvim_buf_set_lines 0 0 -1 true content)
    (vim.api.nvim_win_set_cursor 0 cursor)
    (: (vim.treesitter.get_parser 0) :parse)))

(fn expect [{: cursor : content : lines}]
  (let [lines (or lines 0)
        _ (print lines)
        foo (vim.api.nvim_buf_get_lines 0 lines -1 false)
        _ (print "found text in expect")
        _ (print (vim.inspect foo))]
    (when content
      (assert.are.same content
                       (core.first (vim.api.nvim_buf_get_lines 0 lines -1 false))))
    (when cursor
      (assert.are.same cursor (vim.api.nvim_win_get_cursor 0)))))

{: setup : expect}
