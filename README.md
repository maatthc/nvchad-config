# NvChad Configuration

`git clone --depth 1 https://github.com/maatthc/nvchad-config ~/.config/nvim && nvim`


Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.

Run `:Copilot setup` to setup Copilot and follow the instructions.


## Terminal
When you start a new Terminal from within Neovim, it will set the NVIM environment variable. 
You can use this to customize your Terminal. 
For example, you can use the following code to run 'neofetch' only when you start a shell outside Neovim.

```bash
if [[ ! -v NVIM ]]; then
  neofetch
  alias vi='nvim'
  alias v='nvim'
fi
```

## NvChad Key mappings
See [here](vi-mappings.md) for more details.
