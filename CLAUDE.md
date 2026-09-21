# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration based on kickstart.nvim, with extensive customization through the `lua/custom/` directory. The configuration uses Neovim's built-in `vim.pack` for plugin management (migrated from lazy.nvim) and follows a modular structure:

- `init.lua` - Main entry point with core kickstart.nvim setup, plugin installs (`vim.pack.add`), and LSP/completion/treesitter config
- `lua/custom/options.lua` - Custom Neovim options and settings
- `lua/custom/keymaps.lua` - Custom key mappings
- `lua/custom/plugins/` - Additional plugin installs/configs, auto-loaded from `lua/custom/plugins/init.lua`
- `lua/kickstart/plugins/` - Optional kickstart example plugins; only `gitsigns.lua` is currently wired in via `init.lua`

## Key Commands & Workflows

### Plugin Management
```vim
" Inspect plugin state and pending updates (no network)
:lua vim.pack.update(nil, { offline = true })

" Update plugins
:lua vim.pack.update()
```

### LSP Operations
- `gd` / `grd` - Go to definition
- `grr` - Show references
- `gri` - Go to implementation
- `grt` - Go to type definition
- `grD` - Go to declaration
- `grn` - Rename symbol
- `gra` - Code actions
- `gO` - Document symbols
- `gW` - Workspace symbols
- `<leader>th` - Toggle inlay hints
- `<leader>q` - Open diagnostic quickfix list

### File Navigation
- `<leader>sf` - Find files (includes hidden files)
- `<leader>sg` - Live grep search
- `<leader>sw` - Search current word
- `<leader>sd` - Search diagnostics
- `<leader>sn` - Search Neovim config files
- `<leader><leader>` - Buffer switcher (MRU order)
- `-` - Open file manager (Oil.nvim)

### Git Integration
- `]c` / `[c` - Navigate git hunks
- `<leader>h` + various keys for git operations (stage, reset, preview, blame)
- `<leader>t` + `b`/`D` - Toggle line blame / toggle deleted
- `<leader>gs` - Git status files in Telescope

### Custom Utilities
- `<leader>yp` - Yank current file path to clipboard
- `<leader>yb` - Yank buffer reference (format: `#buffer:/path/to/file`)
- `<leader>yr` - Yank relative file path to clipboard

## Development Configuration

### Code Formatting
- Uses conform.nvim for formatting
- Format-on-save is opt-in per filetype in `init.lua` (`formatters_by_ft` / `enabled_filetypes`); currently no filetypes are enabled by default
- Manual format with `<leader>f`

### Key Plugin Stack
- **LSP**: Native LSP with Mason for language server management (includes `vtsls` for TypeScript/JavaScript)
- **Completion**: Blink.cmp (modern completion engine)
- **File Navigation**: Telescope + Oil.nvim
- **Git**: Gitsigns
- **Icons**: mini.icons (with `MiniIcons.mock_nvim_web_devicons()` for plugin compatibility) — do not add `nvim-web-devicons` separately, it's redundant
- **Syntax**: Treesitter with auto-install

### Editor Behavior
- Leader key: Space
- Relative line numbers disabled (regular line numbers enabled)
- Unified clipboard with system
- 10-line scroll offset for context
- Confirmation dialogs for unsaved changes
- Mouse support enabled

## File Organization Patterns

When modifying this configuration:
- Add new plugins to `lua/custom/plugins/` as separate files (auto-required by `lua/custom/plugins/init.lua`)
- Custom keymaps go in `lua/custom/keymaps.lua`
- Editor options in `lua/custom/options.lua`
- Follow the existing which-key group structure for new keybindings
- If a plugin only installs (`vim.pack.add`) without a keymap or autocmd to trigger it, note that explicitly — it's still loaded at every startup

## Notes on Removed Functionality

- No NX/monorepo tooling: the config previously had NX-specific test/typecheck helpers (`lua/my_commands.lua`, bound to `<leader>yu`/`<leader>yt`); these were removed since the file no longer existed and NX is no longer in use.
- No Diffview: keymaps referencing `:DiffviewOpen`/`:DiffviewFileHistory`/`:DiffviewClose` were removed since the plugin was never actually installed.
- No AI assistant is currently wired in. `vim.g.copilot_enabled = false` in `options.lua` is a leftover setting for the plain GitHub Copilot plugin, which isn't installed. CopilotChat is not installed or configured.

The configuration is designed for general JavaScript/TypeScript development with LSP, completion, treesitter, and git workflow support.
