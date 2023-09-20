if vim.g.vscode then
  -- VSCode extension
  -- Specified via settings.json require("init_vscode")
else
  -- ordinary Neovim
  require("init_core")
end
