(vim.opt.runtimepath:append :./.build/dependencies/plenary.nvim)
(vim.opt.runtimepath:append :./.build/dependencies/nvim-treesitter)
(vim.opt.runtimepath:append :./.build/parsers)
(vim.opt.runtimepath:append ".")
(vim.cmd.runtime {1 :plugin/plenary.vim :bang true})
(vim.cmd.runtime {1 :plugin/nvim-treesitter.lua :bang true})
(set vim.o.swapfile false)
(set vim.bo.swapfile false)
((. (require :nvim-treesitter.configs) :setup) {:ensure_installed [:clojure]
                                                :parser_install_dir (.. (vim.fn.getcwd)
                                                                        :/.build/parsers)
                                                :sync_install true})
