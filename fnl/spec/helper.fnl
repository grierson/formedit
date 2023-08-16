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

(fn escape-keys [keys] (vim.api.nvim_replace_termcodes keys true false true))
(fn feedkeys [keys] (vim.api.nvim_feedkeys (escape-keys keys) :xmt true))

(fn expect [{: cursor : content}]
  (when content
    (assert.are.same content (let [text (vim.api.nvim_buf_get_lines 0 0 10
                                                                    false)]
                               (if (= (core.count text) 1)
                                   (core.first text)
                                   text))))
  (when cursor
    (assert.are.same cursor (vim.api.nvim_win_get_cursor 0))))

{: setup : expect : feedkeys}
