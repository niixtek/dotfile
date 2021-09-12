import XMonad
import Xmonad.Config.Desktop
import Xmonad.Prompt.ConfigPrompt
import System.IO
import System.Exit

main = do
	xmproc <- spawnPipe ("xmobar " ++ myXmobarrc)
	xmonad $ defaults {
		logHook = dynamicLogWithPP $ xmobarPP{
				ppOutput 
		}
		, modMask			= myModMask
		, terminal		= myTerminal
		, borderWidth = myBorderWith
		, keys				= myKeys
	
	}

myTerminal		= "alacritty" -- Terminal
myModMask			= mod4Mask -- Super as mod key
myBorderWidth	= 3

--Keys 
myKeys :: [(String, X ())]
myKeys = 
	[
		-- Xmonad
			("M-<ESC>", spawn "xmonad --recompile") -- Recompil
		, ("M-S-r", spawn "xmonad --restart") -- Restart
		, ("M-A-<ESC>", io exitSuccess) -- Exit

		, ("M-<F12>", spawn "multilockscreen --lock blur --off 1000") -- Lock Screen

	]
