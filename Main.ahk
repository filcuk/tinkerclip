; === APP PARAMS ==========================================
#SingleInstance Force
#Hotstring EndChars -()[]{}':;"/\,.?!`n `t
#Warn VarUnset, Off ; Enable warnings to assist with detecting common errors.
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
Persistent(Persist := true)
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

; === LIBRARIES ===========================================
#Include %A_ScriptDir%\Core
#Include TrayMenu.ahk
#Include Hotstrings.ahk

#Include %A_ScriptDir%\Lib
#Include MouseWiggle.ahk
#Include ExcelModalTerminator.ahk
#Include %A_ScriptDir%\Private\Private0.ahk

; #Include doesn't seem to work inside of a loop:
; Loop Files, A_ScriptDir "\Private\*.ahk"
; 	#Include %A_LoopFilePath%

; === TIMERS ==============================================
SetTimer(MouseWiggle, 1000)			; Wiggle mouse when idle
SetTimer(ExcelModalTerminator, 1000)	; Clear unwanted Excel pop-ups

; === END OF AUTO-EXECUTE =================================
Return