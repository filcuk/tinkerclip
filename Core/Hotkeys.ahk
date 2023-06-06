; Change Apps key to Win key
#HotIf AppWinKey
AppsKey::RWin

; Convert selected text to upper/lower/proper case
^+u::SelectionConvertCase("u")
^+l::SelectionConvertCase("l")
^+p::SelectionConvertCase("p")

SelectionConvertCase(ToCase) {

    ; Backup clipboard
    ClipBak := A_Clipboard
    While (ClipBak != A_Clipboard)
        Sleep(10)
    
    ; Retrieve selection input
    A_Clipboard := ""
    Send("^c")
    If !ClipWait(2) {
        MsgBox("Failed to copy to clipboard.")
        Return
    }
    
    Selection := A_Clipboard

    If (StrLen(Selection) > 60)
        Ans := MsgBox("Convert long selection case?", "TinkerClip - Convert Case", 4385)
    Else
        Ans := "OK"

    If Ans = "OK" {
    
        ; Convert input
        Switch ToCase, False {
            Case "u", "upper":
                NewCase := StrUpper(Selection)
            Case "l", "lower":
                NewCase := StrLower(Selection)
            Case "p", "proper", "t", "title":
                NewCase := StrTitle(Selection)
            Default:
                NewCase := Selection
        }
        
        ; Write out input
        SendInput("{Raw}" NewCase)
        
    }

    ; Restore clipboard
    A_Clipboard := ClipBak
    While (A_Clipboard != ClipBak)
        Sleep(10)

}