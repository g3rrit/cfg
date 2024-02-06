nmap j gj
nmap k gk

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
" exmap back obcommand app:go-back
" nmap <C-o> :back
" exmap forward obcommand app:go-forward
" nmap <C-i> :forward

#nmap <SPACE> n

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward
exmap saveFile obcommand editor:save-file
nmap <SPACE>s :saveFile
exmap nextTab obcommand workspace:next-tab
nmap gt :nextTab
exmap prevTab obcommand workspace:previous-tab
nmap gT :prevTab
exmap appReload obcommand app:reload
#exmap openSearch obcommand editor:open-search
#nmap rf :openSearch
#exmap cmdOpen obcommand command-palette:open
#nmap rp :cmdOpen

