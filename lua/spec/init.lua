-- [nfnl] Compiled from fnl/spec/init.fnl by https://github.com/Olical/nfnl, do not edit.
do end (vim.opt.runtimepath):append("./.build/dependencies/plenary.nvim")
do end (vim.opt.runtimepath):append("./.build/dependencies/nvim-treesitter")
do end (vim.opt.runtimepath):append("./.build/parsers")
do end (vim.opt.runtimepath):append(".")
vim.cmd.runtime({"plugin/plenary.vim", bang = true})
vim.cmd.runtime({"plugin/nvim-treesitter.lua", bang = true})
vim.o.swapfile = false
vim.bo.swapfile = false
return (require("nvim-treesitter.configs")).setup({ensure_installed = {"clojure"}, parser_install_dir = (vim.fn.getcwd() .. "/.build/parsers"), sync_install = true})
