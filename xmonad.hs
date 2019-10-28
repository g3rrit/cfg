import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Tabbed
import Graphics.X11.ExtraTypes.XF86

main = do
    spawnPipe "feh --bg-scale /home/pear/Pictures/nasa_wall.jpg"
    xmonad =<< statusBar "xmobar" xmobarPP toggleStrutsKey myConfig

toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

myConfig = defaultConfig 
  { modMask = mod4Mask
  , borderWidth = 0
  , startupHook = setWMName "LG3D" 
  } `additionalKeysP` myKeys

myKeys =  [ ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +1.5%")
          , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@  -1.5%")
          , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")    

          , ("<XF86AudioPlay>", spawn "playerctl play-pause")    
          , ("<XF86AudioPrev>", spawn "playerctl previous")    
          , ("<XF86AudioNext>", spawn "playerctl next")    

          , ("<XF86MonBrightnessUp>", spawn "lux -a 5%")    
          , ("<XF86MonBrightnessDown>", spawn "lux -s 5%")    
          ]
