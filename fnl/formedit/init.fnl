(local {: autoload} (require :nfnl.module))
(local notify (autoload :nfnl.notify))
(local ts (require :nvim-treesitter.ts_utils))

; (local current-node (ts.get_node_at_cursor))
; (local cursor_pos (vim.api.nvim_win_get_cursor 0))

(fn setup []
  (notify.info :hello))

{: setup}
