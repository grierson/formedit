(local {: autoload} (require :formedit.nfnl.module))
(local notify (autoload :formedit.nfnl.notify))

(fn setup []
  (notify.info "Hello, World!"))

{: setup}
