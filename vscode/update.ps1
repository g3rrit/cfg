# In order to run the script set the execution policy
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Copy-Item -Path "C:\Users\$Env:UserName\AppData\Roaming\Code\User\keybindings.json" keybindings.json
Copy-Item -Path "C:\Users\$Env:UserName\AppData\Roaming\Code\User\settings.json" settings.json
