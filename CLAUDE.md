# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration based on kickstart.nvim, with extensive customization through the `lua/custom/` directory. The configuration uses lazy.nvim for plugin management and follows a modular structure:

- `init.lua` - Main entry point with core kickstart.nvim setup
- `lua/custom/options.lua` - Custom Neovim options and settings
- `lua/custom/keymaps.lua` - Custom key mappings
- `lua/custom/plugins/` - Plugin-specific configurations (overrides kickstart defaults)
- `lua/my_commands.lua` - Global custom commands
- `lazy-lock.json` - Plugin version lockfile

## Key Commands & Workflows

### Plugin Management
```bash
# Update all plugins
:Lazy update

# View plugin status
:Lazy

# Install/sync plugins
:Lazy sync
```

### Testing (NX/Monorepo Support)
- Use the custom `CopyTestCmd()` function to generate NX test commands
- Function searches for nearest `project.json` and creates clipboard-ready test command
- Format: `nx run <project>:test --testFiles <current-file>`

### LSP Operations
- `gd` - Go to definition
- `gr` - Show references
- `grn` - Rename symbol
- `<leader>ca` - Code actions
- `gh` - Show hover documentation
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
- `<leader>gs` - Git status files in Telescope

### AI Assistant (CopilotChat)
- `<leader>aa` - Toggle chat
- `<leader>aq` - Quick chat
- `<leader>ap` - Prompt actions
- `<leader>af` - Add current buffer to chat context
- `<leader>ax` - Clear chat

### Custom Utilities
- `<leader>yp` - Yank current file path to clipboard
- `<leader>yb` - Yank buffer reference (format: `#buffer:/path/to/file`)

## Development Configuration

### Copilot Settings
- Copilot is disabled by default (`vim.g.copilot_enabled = false`)
- CopilotChat is enabled as the primary AI assistant

### Code Formatting
- Uses conform.nvim for formatting
- Configured for JavaScript/TypeScript with prettierd and eslint_d
- Format on save enabled (except for C/C++)
- Manual format with `<leader>f`

### Key Plugin Stack
- **LSP**: Native LSP with Mason for language server management
- **Completion**: Blink.cmp (modern completion engine)
- **File Navigation**: Telescope + Oil.nvim
- **Git**: Gitsigns + Diffview
- **AI**: CopilotChat (Avante and CodeCompanion are disabled)
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
- Add new plugins to `lua/custom/plugins/` as separate files
- Custom keymaps go in `lua/custom/keymaps.lua`
- Editor options in `lua/custom/options.lua`
- Global commands in `lua/my_commands.lua`
- Follow the existing which-key group structure for new keybindings

The configuration is designed for JavaScript/TypeScript development with strong support for NX monorepos, git workflows, and AI-assisted coding.