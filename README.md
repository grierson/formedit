# Form edit

Paredit in Fennel for Clojure

## Features

- Form text objects
  - Lists (s-exp, quoted list), vector, set are all under one text object
  - so instead of `di(` `di[` `di{` just `dif` (or any other text object command)
  - `f` for current form. `F` for root form
- Slurp
  - Bring in element/form into your form
- Raise
  - Remove parent form and replace with current form
- Wrap
  - Add form around current form
- Insertion
  - Move cursor to begining/end for form in insert mode

## Todo

- [ ] - Inner select
- [ ] - Barf

## Dev Getting started

```bash
./scripts/nfnl   # To download nfnl
just test   # Run tests
just watch {featuer}   # Run watch tests for feature
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
