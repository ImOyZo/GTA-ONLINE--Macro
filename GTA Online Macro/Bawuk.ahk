; ================================
; === Main Function is for PVP ===
; ================================

SetWorkingDir %A_ScriptDir%
#NoEnv
#IfWinActive ahk_class grcWindow

;==================================================
;Toggle VIP Mode (Needed for Interaction Menu)
F12::
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
    SplashTextOn 250, 20, VIP mode, VIP mode has been ACTIVATED
    }
  Sleep 2000
  SplashTextOff
  return
;=============================================================

;========================================
;Buy BullShark Testosterone
F4:: 
if (IsVIPActivated)
{
    SetCapsLockState off
    Send {m} 
    Sleep 20
    Send {Enter} 
    Sleep 20
    Send {Up 3} 
    Sleep 20
    Send {Enter} 
    Sleep 20
    Send {Down} 
    Sleep 20 
    Send {Enter} 
}
Else (IsVIPActivated, false)
{
  Send {Esc}
  Sleep 25
  Send {Esc}
  Sleep 25
  Send {Esc}
  Sleep 25
  Send {Esc}
  Sleep 25
  Send {Esc}
  Sleep 25
  Send {Esc}
  Sleep 25
  Send {Esc}
  Sleep 25
  Send {Esc}
}
Return
;=======================================

;=======================================
;Enable Ghost Organization
F5::
if (IsVIPActivated, true)
{
    SetCapsLockState off
    Send {m}
    Sleep 100
    Send {Enter}
    Sleep 100
    Send {Up 3}
    Sleep 100
    Send {Enter}
    Sleep 100
    Send {Up 3}
    Sleep 100
    Send {Enter}
}
else (IsCPHActivated, false)
{
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
 Sleep 150
 Send {Esc}
}
Return
;=======================================

;=======================================
;AFK (Ok it's working... kinda)
#MaxThreadsPerHotkey 2
F6::
Toggle := !Toggle
Loop
{
    If not Toggle
        Break
        Send {w}
        Sleep 1000
}
;=================================================


;Open Buy Ammo Menu
F7::
if (IsVIPActivated)
{
    Send {m}
    Sleep 50
    Send {Down 3}
    Sleep 50
    Send {Enter}
    Sleep  2000
    Send {Down 5}
    Sleep 50
    Send {Enter}
}
else
{
    Send {m}
    Sleep 50
    Send {Down 2}
    Sleep 50
    Send {Enter}
    Sleep  2000
    Send {Down 5}
    Sleep 50
    Send {Enter}
}
return