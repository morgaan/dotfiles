# Neovim configuration

It's now exclusively compatible to **Neovim** and therefore use **lua** and the
`init.lua` file for its entry point.

## Directory structure

- `nvim/`: Neovim configuration directory (i.e `$XDG_CONFIG_HOME/nvim`)
  - `lua/`: Home for Neovim lua configuration
    - `config/`: Home for Neovim options, keymaps, commands...
    - `plugins/`: Home for Neovim plugins configurations
  - `init.lua`: Neovim configuration entry point

## Plugin management

I use Lazy.nvim as plugins manager, waiting for `vim.pack` to mature.

Key features:

- 📦 Manage Neovim plugins with a powerful UI (`:Lazy`)
- 🚀 Fast startup times thanks to automatic caching and bytecode compilation of
  Lua modules
- 🔌 Automatic lazy-loading of Lua modules and lazy-loading on events, commands,
  filetypes, and key mappings
- ⏳ Automatically install missing plugins before starting up Neovim, allowing
  you to start using it right away
- 📁 Configurable in multiple files
  - Any lua file in ~/.config/nvim/lua/plugins/\*.lua will be automatically
      merged in the main plugin spec.
- 🔒 Lockfile lazy-lock.json to keep track of installed plugins
- 📋 Commit, branch, tag, version, and full Semver support

And many more on [Lazy features](https://lazy.folke.io/#-features)
