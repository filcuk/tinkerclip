; === APP PARAMS ==========================================
#SingleInstance Force
#Hotstring EndChars -()[]{}':;"/\,.?!`n `t
#Warn VarUnset, Off
SendMode "Input"
Persistent(Persist := true)
SetWorkingDir A_ScriptDir

; === LIBRARIES ===========================================
#Include %A_ScriptDir%\Core	; Core libs
#Include TrayMenu.ahk       ; Tray menu
#Include Hotstrings.ahk     ; Hotstrings
#Include Hotkeys.ahk        ; Hotkeys
#Include KeyListGUI.ahk     ; Key list GUI
#Include InsertCharGUI.ahk  ; Char insert GUI

#Include %A_ScriptDir%\Lib ; Misc libs and fns
#Include MD_SourceLink.ahk
#Include SendInstant.ahk
#Include MouseWiggle.ahk
#Include ExcelModalTerminator.ahk

#Include %A_ScriptDir%\Private\Private0.ahk

; #Include doesn't seem to work inside of a loop:
; Loop Files, A_ScriptDir "\Private\*.ahk"
; 	#Include %A_LoopFilePath%

; === TIMERS ==============================================
SetTimer(MouseWiggle, 1000)				; Wiggle mouse when idle
SetTimer(ExcelModalTerminator, 1000)	; Clear unwanted Excel pop-ups

; === END OF AUTO-EXECUTE =================================
Return