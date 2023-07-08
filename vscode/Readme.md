# Windows

Update the `keybindings.json` and `settings.json` with `update.ps1`.

Symlink the `nvim` directory via:

```ps1
New-Item -ItemType SymbolicLink -Target C:\Users\<user>\Desktop\git\cfg\vscode\nvim -Path C:\Users\<user>\AppData\Local\nvim
New-Item -ItemType SymbolicLink -Target C:\Users\<user>\Desktop\git\cfg\vscode\nvim -Path C:\Users\<user>\.config\nvim
```
