# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration based on the Kickstart.nvim template with extensive customizations. The configuration uses lazy.nvim as the plugin manager and follows a modular architecture:

- **Core Configuration**: `init.lua` contains the main setup with global settings, options, basic keymaps, and plugin loading
- **Kickstart Plugins**: `lua/kickstart/plugins/` - Standard kickstart plugins (autopairs, debug, gitsigns, indent_line, lint, neo-tree)
- **Custom Extensions**: `lua/custom/` - User-specific customizations
  - `lua/custom/keymaps.lua` - Custom keybindings and shortcuts
  - `lua/custom/plugins/` - Extended plugin configurations

## Key Components

### LSP and Language Support
- **LSP**: nvim-lspconfig with Mason for automatic LSP installation
- **Completion**: blink.cmp with LSP, buffer, and snippet sources
- **Formatters**: conform.nvim for code formatting
- **Languages**: Supports Go, Rust, Lua, JavaScript/TypeScript, JSON, and Zig
- **Treesitter**: Full syntax highlighting and text objects

### Navigation and File Management
- **Telescope**: Primary fuzzy finder with fd and ripgrep integration
- **Oil**: File manager accessible via `-` key
- **Yazi**: Advanced file manager integration
- **Grapple**: Project file bookmarking

### Development Tools
- **Testing**: vim-test with toggleterm integration
- **Git**: Gitsigns, Neogit for Git operations
- **AI Assistance**: CodeCompanion with multiple provider support (OpenAI, DeepSeek, Gemini)
- **Terminal**: Toggleterm for integrated terminal management

### UI Enhancements
- **Theme**: Kanagawa colorscheme
- **Statusline**: Custom lualine configuration
- **Buffer Management**: Bufferline and buffer navigation
- **Start Screen**: Alpha dashboard
- **Notifications**: Snacks.nvim for enhanced notifications

## File Structure Conventions

- **2-space indentation** for Lua, JSON, JavaScript/TypeScript
- **4-space indentation** for Go (with tabs)
- **Tab characters** preserved for Go files
- **Global settings** applied in `init.lua` with filetype-specific overrides

## Essential Commands

### Plugin Management
```bash
# Install/update plugins
:Lazy

# Update all plugins
:Lazy update

# Check plugin health
:checkhealth
```

### LSP Operations
```bash
# Install language servers
:Mason

# Format current buffer
<leader>fb

# LSP actions (when cursor on symbol)
grn - Rename symbol
gra - Code actions
grr - Find references
grd - Go to definition
gri - Go to implementation
```

### Testing
```bash
# Run nearest test
<leader>uu

# Run current file tests
<leader>uf

# Run last test
<leader>ul
```

### File Navigation
```bash
# Find files
<leader>e or <leader>sf

# Live grep
<leader>g or <leader>sg

# Recent files
<leader>s.

# File manager
- (opens Oil in current directory)
```

## Custom Keybindings

### Core Navigation
- `<C-h/j/k/l>` - Window navigation
- `,,` - Toggle between last two buffers
- `<leader>x` - Close current buffer (using Bdelete)
- `<C-s>` - Save file (works in normal, insert, visual modes)

### Visual Mode Enhancements
- `J/K` - Move selected lines up/down
- `</>`  - Indent left/right (maintains selection)

### AI Integration
- `<leader>aa` - Toggle CodeCompanion chat
- `<leader>ad` - Add to CodeCompanion chat
- `<leader>ap` - Open CodeCompanion actions
- `<leader>ai` - Inline CodeCompanion
- `<leader>as` - Quick ask CodeCompanion

## Configuration Patterns

### Adding New Plugins
1. Create new file in `lua/custom/plugins/`
2. Return plugin specification table
3. Use lazy loading when appropriate
4. Follow existing keymap patterns with descriptive names

### Extending LSP Support
1. Add server to `servers` table in `init.lua`
2. Install via Mason (`:Mason`)
3. Configure any server-specific settings in the servers table

### Customizing Keymaps
1. Add to `lua/custom/keymaps.lua`
2. Use descriptive `desc` fields for which-key integration
3. Follow leader key grouping conventions:
   - `<leader>s` - Search operations
   - `<leader>t` - Toggle operations
   - `<leader>u` - Unit testing
   - `<leader>a` - AI/Agent operations

## Development Environment

- **Neovim Version**: 0.11.4+ required
- **Package Manager**: lazy.nvim
- **File Search**: Uses `fd` with .fdignore support
- **Text Search**: Uses `ripgrep` (rg)
- **Terminal**: Integrated via toggleterm
- **Platform**: Optimized for macOS (Darwin)