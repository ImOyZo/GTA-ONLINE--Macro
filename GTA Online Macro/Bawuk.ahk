; ================================
; === Main Function is for PVP ===
; ================================

SetWorkingDir %A_ScriptDir%
#NoEnv
;#IfWinActive ahk_class grcWindow

;==================================================
; Delay
IniRead, IntMenuDelay, config.ini, Delay, IntMenuDelay
IniRead, KeyPressDelay, config.ini, Delay, KeyPressDelay
IniRead, PhoneDelay, config.ini, Delay, PhoneDelay
IniRead, AntiAFKLoopDelay, config.ini, Delay, AntiAFKLoopDelay
IniRead, AmmoMenuWaitTime, config.ini, Delay, AmmoMenuWaitTime
;======================================================
; KeyBind
IniRead, ToggleVIPMode, config.ini, KeyBind, ToggleVIPMode
IniRead, BuyBST, config.ini, KeyBind, BuyBST
IniRead, EnableGO, config.ini, KeyBind, EnableGO
IniRead, AntiAFK, config.ini, KeyBind, AntiAFK
IniRead, OpenAmmoMenu, config.ini, KeyBind, OpenAmmoMenu

Hotkey, %ToggleVIPMode%, ToggleVIPMode
Hotkey, %BuyBST%, BuyBST
Hotkey, %EnableGO%, EnableGO
Hotkey, %AntiAFK%, AntiAFK
Hotkey, %OpenAmmoMenu%, OpenAmmoMenu

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
{
    SetCapsLockState off
    SendInput {m} 
    Sleep %IntMenuDelay%
    SendInput {Enter} 
    Sleep %IntMenuDelay%
    SendInput {Up 3} 
    Sleep %IntMenuDelay%
    SendInput {Enter} 
    Sleep %IntMenuDelay%
    SendInput {Down} 
    Sleep %IntMenuDelay%
    SendInput {Enter} 
}
Return
;=======================================

;=======================================
;Enable Ghost Organization
EnableGO:
{
    SetCapsLockState off
    SendInput {m}
    Sleep %IntMenuDelay%
    SendInput {Enter}
    Sleep %IntMenuDelay%
    SendInput {Up 3}
    Sleep %IntMenuDelay%
    SendInput {Enter}
    Sleep %IntMenuDelay%
    SendInput {Up 3}
    Sleep %IntMenuDelay%
    SendInput {Enter}
}
Return
;=======================================

;=======================================
;AFK (Ok it's working... kinda)
#MaxThreadsPerHotkey 2
AntiAFK:
{
  Toggle := !Toggle
  Loop
  {
    If not Toggle
        Break
        SendInput {w}
        Sleep %AntiAFKLoopDelay%
  }
}  
;=================================================


;Open Buy Ammo Menu
OpenAmmoMenu:
if (VIPModeActivated)
{
    SendInput {m}
    Sleep %IntMenuDelay%
    SendInput {Down 3}
    Sleep %IntMenuDelay%
    SendInput {Enter}
    Sleep %AmmoMenuWaitTime%
    SendInput {Down 5}
    Sleep %IntMenuDelay% 
    SendInput {Enter}
}
else
{
    SendInput {m}
    Sleep %IntMenuDelay%
    SendInput {Down 2}
    Sleep %IntMenuDelay%
    SendInput {Enter}
    Sleep  %AmmoMenuWaitTime%
    SendInput {Down 5}
    Sleep %IntMenuDelay%
    SendInput {Enter}
}
return
