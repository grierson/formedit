prepare:
  #!/usr/bin/env bash
  test -d .build/nvim || {
    mkdir -p ./.build/nvim

    os=$(uname)
    if [[ "$os" == "Darwin" ]]; then
      curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz > ./.build/nvim-macos.tar.gz
      xattr -c ./.build/nvim-macos.tar.gz
      tar xzf ./.build/nvim-macos.tar.gz -C ./.build/nvim --strip-components=1
      rm ./.build/nvim-macos.tar.gz
    elif [[ "$os" == "Linux" ]]; then
      curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz > ./.build/nvim-linux64.tar.gz
      tar xzf ./.build/nvim-linux64.tar.gz -C ./.build/nvim --strip-components=1
      rm ./.build/nvim-linux64.tar.gz
    else
      echo "Unsupported operating system: $os"
      exit 1
    fi
  }

  test -d .build/dependencies || {
    mkdir -p ./.build/dependencies
    git clone --depth 1 https://github.com/nvim-lua/plenary.nvim ./.build/dependencies/plenary.nvim
    git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter ./.build/dependencies/nvim-treesitter
  }

test: prepare
  ./.build/nvim/bin/nvim --version
  ./.build/nvim/bin/nvim \
    --headless \
    --noplugin \
    -u lua/spec/init.lua \
    -c "PlenaryBustedDirectory lua/spec { minimal_init='lua/spec/init.lua', sequential=true }"

file feature: prepare
  ./.build/nvim/bin/nvim --version
  ./.build/nvim/bin/nvim \
    --headless \
    --noplugin \
    -u lua/spec/init.lua \
    -c "PlenaryBustedFile lua/spec/{{feature}}_spec.lua"

focus feature: prepare
  ./.build/nvim/bin/nvim --version
  ./.build/nvim/bin/nvim \
    --headless \
    --noplugin \
    -u lua/spec/init.lua \
    -c "PlenaryBustedDirectory lua/spec/{{feature}} { minimal_init='lua/spec/init.lua', sequential=true }"

watch feature:
  fswatch -o lua/formedit/{{feature}}.lua lua/spec/{{feature}}_spec.lua | xargs -n1 -I{} just file {{feature}}
