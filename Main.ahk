#Warn VarUnset, Off ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

Persistent(Persist := true)
#SingleInstance Force
#Include "%A_ScriptDir%\Lib"

Hotstring("EndChars", " `n`t")

; End of app config

MenuNoIdle := "No &Idle"
MenuNoIdleEnabled := true
MenuAppReload := "&Reload"
MenuAppExit := "&Exit"
MenuTest := "Test"

; Menu, Tray, Add
; Menu, Tray, Add, % MenuNoIdle, MenuHandler
; If MenuNoIdleEnabled
; 	Menu, Tray, Check, % MenuNoIdle
; Else
; 	Menu, Tray, UnCheck, % MenuNoIdle
; Menu, Tray, Add
; Menu, Tray, Add, % MenuAppReload, MenuHandler
; Menu, Tray, Add, % MenuAppExit, MenuHandler
; Menu, Tray, Add, % MenuTest, MenuHandler





; Inactivity loop
;~ #InstallKeybdHook
;~ #InstallMouseHook

MaxIdleMs := 1000 * 60
MoveS := 50
MoveL := 100


; === LIBRARIES ===========================================
#Include ExcelModalTerminator.ahk
#Include %A_ScriptDir%\Core\Hotstrings.ahk
#Include %A_ScriptDir%\Private\Private0.ahk

; #Include doesn't seem to work inside of a loop:
; Loop Files, A_ScriptDir "\Private\*.ahk"
; 	#Include %A_LoopFilePath%

; === TIMERS ==============================================
; SetTimer, IdleLoop, 1000		; Move mouse when idle
SetTimer(ExcelModalTerminator, 1000)	; Clear unwanted Excel pop-ups

; === END OF AUTO-EXECUTE =================================
return

; If computer was idle for certain ammount of time, move mouse
; IdleLoop:
; If (A_TimeIdle > MaxIdleMs && MenuNoIdleEnabled)
; {
; 	SendEvent {Click rel 0, -%MoveS%, 0}
; 	SendEvent {Click rel 0, %MoveL%, 0}
; 	SendEvent {Click rel 0, -%MoveS%, 0}
; 	SendEvent {Click rel %MoveS%, 0, 0}
; 	SendEvent {Click rel -%MoveL%, 0, 0}
; 	SendEvent {Click rel %MoveS%, 0, 0}
	
; 	Sleep % MaxIdleMs * 0.75
; }
; return






; MenuHandler:
; MenuID := A_ThisMenu
; MenuItemID := A_ThisMenuItem
; MenuItemPos := A_ThisMenuItemPos

; Switch MenuItemID
; {
; 	Case % MenuNoIdle:
; 		Menu, % MenuID, ToggleCheck, % MenuItemID
; 		MenuNoIdleEnabled := !MenuNoIdleEnabled
; 		return
; 	Case % MenuAppReload:
; 		Reload
; 	Case % MenuAppExit:
; 		ExitApp
; 	Case % MenuTest:
; 		MsgBox % MenuID . ", " . MenuItemID . ", " . MenuItemPos
; }

; Scrub selector from URL
$^c::
{
	Clipboard := ""
	Send "^c"
	Clipwait 3
	Contents := Clipboard

	if (InStr(Contents, "https://redacted.com/") != 0) {
		; URL contains selector
		if (InStr(Contents, "#") != 0)
			Contents := SubStr(Contents, 1, InStr(Contents, "?")) . SubStr(Contents, InStr(Contents, "#"))
		else
			Contents := SubStr(Contents, 1, InStr(Contents, "?") - 1)
		
		Clipboard := Contents
	}
}