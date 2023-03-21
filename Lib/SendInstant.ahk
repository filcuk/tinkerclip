; SendInstant
; -----------------------------------------------
; Used to insert text instantly (as opposed to
; AHK's char-by-char Send) utilising Clipboard.
; Inspired by:
; https://www.autohotkey.com/boards/viewtopic.php?p=483549

SendInstant(Text) {
    ; Backup clipboard, store text
    ClipBak := ClipboardAll()
    A_Clipboard := ""
    A_Clipboard := Text

    ; Insert text
    If !ClipWait(2, False) {
        MsgBox("Failed to update clipboard.")
        Return
    }
    Send("^v")
    
    ; Restore clipboard
    Sleep(250)
    A_Clipboard := ClipBak
}