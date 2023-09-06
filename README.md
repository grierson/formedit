# Form edit

Paredit in Fennel for Clojure using Treesitter

## Features

- Form text objects
  - Lists (s-exp, quoted list), vector, set are all under one text object
    so instead of `di(` `di[` `di{` just `dif` (or any other text object command)
    `f` for current form. `F` for root form
- Slurp (Forward + Backwards)
  - Bring in element/form into your form
- Barf (Forward + Backwards)
  - Remove an element/form from your form
- Raise
  - Remove parent form and replace with current form
- Wrap
  - Add form around current form
- Insertion
  - Move cursor to begining/end of form in insert mode

## Install

For lazy package manager

```lua
"grierson/formedit"
```

## Example keymap

Based of `tpope/vim-sexp-mappings-for-regular-people`

```lua
local formedit = require("formedit")
vim.keymap.set('o', 'af', formedit.select.form, { desc = "Outer form" })
vim.keymap.set('o', 'aF', formedit.select.root, { desc = "Outer root form" })
vim.keymap.set('o', 'if', formedit.select.inner, { desc = "Inner form" })
vim.keymap.set('o', 'iF', formedit.select["inner-root"], { desc = "Inner root form" })
vim.keymap.set('n', '<localleader>h', formedit.insertion.head, { desc = "Head insert" })
vim.keymap.set('n', '<localleader>H', formedit.insertion.tail, { desc = "Tail insert" })
vim.keymap.set('n', '<localleader>i', formedit.wrap.head, { desc = "Wrap form " })
vim.keymap.set('n', '<localleader>o', formedit.raise.form, { desc = "Raise form" })
vim.keymap.set('n', '<localleader>O', formedit.raise.element, { desc = "Raise element" })
vim.keymap.set('n', '>)', formedit.slurp.forward, { desc = "Slurp forward" })
vim.keymap.set('n', '<(', formedit.slurp.backward, { desc = "Slurp backward" })
vim.keymap.set('n', '>(', formedit.barf.backward, { desc = "Barf backward" })
vim.keymap.set('n', '<)', formedit.barf.forward, { desc = "Barf forward" })
```

## Developer Getting started

```bash
./scripts/nfnl          # Download nfnl
just test               # Run tests
just watch {featuer}    # Run test in watch mode for feature
```

## Unlicensed

Find the full [Unlicense][unlicense] in the `UNLICENSE` file, but here's a
snippet.

> This is free and unencumbered software released into the public domain.
>
> Anyone is free to copy, modify, publish, use, compile, sell, or distribute
> this software, either in source code form or as a compiled binary, for any
> purpose, commercial or non-commercial, and by any means.

[neovim]: https://neovim.io/
[fennel]: https://fennel-lang.org/
[nfnl]: https://github.com/Olical/nfnl
[unlicense]: http://unlicense.org/
[plenary]: https://github.com/nvim-lua/plenary.nvim
[guns/vim-sexp]: https://github.com/guns/vim-sexp
[tpope/vim-sexp-mappings-for-regular-people]: https://github.com/tpope/vim-sexp-mappings-for-regular-people
