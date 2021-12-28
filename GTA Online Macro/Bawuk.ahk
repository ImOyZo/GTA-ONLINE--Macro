; ================================
; === Main Function is for PVP ===
; ================================

SetWorkingDir %A_ScriptDir%
#NoEnv
#IfWinActive ahk_class grcWindow

;==================================================
; Delay (Change Delay in config.ini file)
IniRead, IntMenuDelay, config.ini, Delay, IntMenuDelay
IniRead, KeyPressDelay, config.ini, Delay, KeyPressDelay
IniRead, PhoneDelay, config.ini, Delay, PhoneDelay
IniRead, AntiAFKLoopDelay, config.ini, Delay, AntiAFKLoopDelay
IniRead, AmmoMenuWaitTime, config.ini, Delay, AmmoMenuWaitTime
;======================================================
; config.ini File read
IniRead, ToggleVIPMode, config.ini, KeyBind, ToggleVIPMode
IniRead, BuyBST, config.ini, KeyBind, BuyBST
IniRead, EnableGO, config.ini, KeyBind, EnableGO
IniRead, OpenAmmoMenu, config.ini, KeyBind, OpenAmmoMenu
IniRead, EnableBribeAuthorities, config.ini, KeyBind, EnableBribeAuthorities
;IniRead, CallMMI, config.ini, KeyBind, CallMMI

;===========================================================
; KeyBind Setting (Change Keybind in config.ini file)
Hotkey, %ToggleVIPMode%, ToggleVIPMode
Hotkey, %BuyBST%, BuyBST
Hotkey, %EnableGO%, EnableGO
Hotkey, %OpenAmmoMenu%, OpenAmmoMenu
Hotkey, %EnableBribeAuthorities%, EnableBribeAuthorities
;Hotkey, %CallMMI%, CallMMI

;==================================================
;Toggle VIP Mode (Needed for Interaction Menu)
ToggleVIPMode:
Toggle:
  if (VIPModeActivated) 
  {
    if (VIPModeOn) 
    {
      if (VIPModeEnable) 
      {
        VIPModeActivated := false
        SplashTextOn 280, 20, VIP mode, VIP mode has been DEACTIVATED
      } 

    } 
    else 
    {
      VIPModeActivated := false
      SplashTextOn 270, 60, VIP mode, VIP mode has been DEACTIVATED `n Press F12 To Activated VIP Mode
    }
  } 
  else 
    {
      VIPModeActivated := true
      SplashTextOn 270, 60, VIP mode, VIP mode has been ACTIVATED `n Press F12 To Deactivated VIP Mode
    }
  Sleep 2000
  SplashTextOff
  return
;=============================================================

;========================================
;Buy BullShark Testosterone
BuyBST:
    SetCapsLockState off
    Send {m} 
    Sleep %IntMenuDelay%
    Send {Enter} 
    Sleep %IntMenuDelay%
    Send {Up 3} 
    Sleep %IntMenuDelay%
    Send {Enter} 
    Sleep %IntMenuDelay%
    Send {Down} 
    Sleep %IntMenuDelay%
    Send {Enter} 

Return
;=======================================

;=======================================
;Enable Ghost Organization
EnableGO:
    SetCapsLockState off
    Send {m}
    Sleep %IntMenuDelay%
    Send {Enter}
    Sleep %IntMenuDelay%
    Send {Up 3}
    Sleep %IntMenuDelay%
    Send {Enter}
    Sleep %IntMenuDelay%
    Send {Up 3}
    Sleep %IntMenuDelay%
    Send {Enter}
Return
;=======================================


;=================================================
;Open Buy Ammo Menu
OpenAmmoMenu:
if (VIPModeActivated)
{
    Send {m}
    Sleep %IntMenuDelay%
    Send {Down 3}
    Sleep %IntMenuDelay%
    Send {Enter}
    Sleep %AmmoMenuWaitTime%
    Send {Down 5}
    Sleep %IntMenuDelay% 
    Send {Enter}
}
else
{
    Send {m}
    Sleep %IntMenuDelay%
    Send {Down 2}
    Sleep %IntMenuDelay%
    Send {Enter}
    Sleep  %AmmoMenuWaitTime%
    Send {Down 5}
    Sleep %IntMenuDelay%
    Send {Enter}
}
return
;=========================================================

;=========================================================
; Enable Bribe Authorities
EnableBribeAuthorities:
  SetCapsLockState off
    Send {m} 
    Sleep %IntMenuDelay%
    Send {Enter} 
    Sleep %IntMenuDelay%
    Send {Up 3} 
    Sleep %IntMenuDelay%
    Send {Enter} 
    Sleep %IntMenuDelay%
    Send {Up 2}
    Sleep %IntMenuDelay%
    Send {Enter}
Return
;=================================================

