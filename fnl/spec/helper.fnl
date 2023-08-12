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

(fn expect [{: cursor : content}]
  (when content
    (assert.are.same content
                     (core.first (vim.api.nvim_buf_get_lines 0 0 10 false))))
  (when cursor
    (assert.are.same cursor (vim.api.nvim_win_get_cursor 0))))

{: setup : expect}
