# alty-keys.nvim

Alty-keymap for neovim.
See https://github.com/lumiknit/alty-key-map.

## Usage

For packer, add this to your `init.lua`:

```lua
use {
  'lumiknit/alty-keys.nvim',
  config = function()
    require("alty-keys").setup()
    # Recommand to use with `virtualedit=onemore` option.
    vim.opt.virtualedit = "onemore"
  end
}
```
