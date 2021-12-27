; ================================
; === Main Function is for PVP ===
; ================================

SetWorkingDir %A_ScriptDir%
#NoEnv
#IfWinActive ahk_class grcWindow

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
  if (IsVIPActivated) 
  {
    if (DoToggleCPHWithVIP) 
    {
      if (IsCPHActivated) 
      {
        IsVIPActivated := false
        SplashTextOn 280, 20, VIP&CPH mode, VIP&&CPH mode has been DEACTIVATED
      } 
      else 
      {
        IsCPHActivated := true
        SplashTextOn 350, 20, CPH mode, Cayo Perico Heist mode has been ACTIVATED
      }
    } 
    else 
    {
      IsVIPActivated := false
      SplashTextOn 250, 20, VIP mode, VIP mode has been DEACTIVATED
    }
  } 
  else 
    {
    IsVIPActivated := true
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
}
Return
;=======================================

;=======================================
;Enable Ghost Organization
EnableGO:
{
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
}
Return
;=======================================

;=======================================
;AFK (Ok it's working... kinda)
#MaxThreadsPerHotkey 2
AntiAFK:
Toggle := !Toggle
Loop
{
    If not Toggle
        Break
        Send {w}
        Sleep %AntiAFKLoopDelay%
}
;=================================================


;Open Buy Ammo Menu
OpenAmmoMenu:
if (IsVIPActivated)
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
