(local {: describe : it} (require :plenary.busted))
(local h (require :spec.nfnl.helper))

(describe "move cursor"
          (fn []
            (it :forward
                (fn []
                  (h.setup {:content "(a)" :cursor [1 1]})
                  (vim.api.nvim_win_set_cursor 0 [1 2])
                  (h.expect {:content "(a)" :cursor [1 2]})))
            (it :back
                (fn []
                  (h.setup {:content "(a)" :cursor [1 2]})
                  (vim.api.nvim_win_set_cursor 0 [1 1])
                  (h.expect {:content "(a)" :cursor [1 1]})))
            (it "no movement"
                (fn []
                  (h.setup {:content "(a)" :cursor [1 1]})
                  (vim.api.nvim_win_set_cursor 0 [1 1])
                  (h.expect {:content "(a)" :cursor [1 1]})))))
