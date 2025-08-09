# 🎹 Keyboard Layout Support

This Neovim configuration supports both **QWERTY** (default) and **Dvorak** keyboard layouts.

## 🎯 Quick Start

### QWERTY Users (Default)
No setup required! The configuration uses standard QWERTY keybindings by default.

### Dvorak Users
Choose one of these methods to enable Dvorak support:

#### Method 1: Command (Temporary)
```vim
:DvorakEnable
```

#### Method 2: Environment Variable (Persistent)
```bash
export NVIM_DVORAK=1
nvim
```

#### Method 3: Configuration File (Permanent)
Edit `lua/config/keyboard-layout.lua` and set:
```lua
local ENABLE_DVORAK = true
```

#### Method 4: Toggle Keymap
Press `<leader>td` (Space + t + d) to toggle between layouts.

## 🔄 Switching Between Layouts

| Command | Description |
|---------|-------------|
| `:DvorakEnable` | Switch to Dvorak layout |
| `:DvorakDisable` | Switch to QWERTY layout |
| `:DvorakToggle` | Toggle between layouts |
| `:DvorakStatus` | Show current layout |
| `<leader>td` | Toggle layouts (keymap) |

## 🎹 Dvorak Layout Features

When Dvorak mode is enabled, you get:

### Optimized Movement
- **`qhuj`** - Left, Down, Up, Right (instead of `hjkl`)
- **`t/T`** - Next word (instead of `w/W`)
- **`w/W`** - End of word (instead of `e/E`)

### Comfortable Operations
- **`-`** - Escape (in insert mode)
- **`n/N`** - Insert mode (instead of `i/I`)
- **`i/I`** - Undo (instead of `u/U`)
- **`k/K`** - Next/previous search match (instead of `n/N`)

### Enhanced Features
- All plugins work seamlessly with Dvorak
- LSP navigation optimized for Dvorak
- Telescope shortcuts adapted for Dvorak layout
- Terminal navigation with Dvorak keys

## 📚 Documentation

- **QWERTY Users**: Use the main `USER_GUIDELINES.md`
- **Dvorak Users**: See `USER_GUIDE_DVORAK.md` for comprehensive Dvorak-specific documentation

## 🔧 Customization

### For QWERTY Users
All keymaps follow standard Vim conventions. Customize in:
- `lua/config/keymaps.lua` - General keymaps
- `lua/plugins/` - Plugin-specific keymaps

### For Dvorak Users
Dvorak-specific mappings can be customized in:
- `lua/config/dvorak-keymaps-optional.lua` - Core Dvorak mappings
- `lua/config/keyboard-layout.lua` - Layout switching logic

## 🤝 Pair Programming

When pair programming with QWERTY users:
1. Run `:DvorakDisable` to switch to QWERTY
2. When done, run `:DvorakEnable` to switch back
3. Or use `<leader>td` to quickly toggle

## 🐛 Troubleshooting

### Dvorak Not Working?
1. Check status: `:DvorakStatus`
2. Try toggling: `:DvorakToggle`
3. Force enable: `:DvorakEnable`

### Keys Not Responding?
Some plugins might override mappings. Try:
1. `:DvorakDisable` then `:DvorakEnable`
2. Restart Neovim
3. Check for conflicting plugins

### Reset to Defaults
```vim
:DvorakDisable  " Switch to QWERTY
" Or restart Neovim for clean state
```

## 🚀 Contributing

When contributing to this configuration:
- Test changes with both QWERTY and Dvorak layouts
- Use `:DvorakToggle` to verify compatibility
- Document any layout-specific features
- Keep QWERTY as the default for broader accessibility

---

**Happy coding on your preferred layout!** 🎹⌨️
