
; Use clipboard to instantly insert text instead of sending individual keystrokes
; Saves and restores initial clipboard content
; https://www.autohotkey.com/boards/viewtopic.php?p=483549&sid=c8136c2ed3bf174201b1ec5c72d1ffb7#p483549
PasteThis(text)
{
    Static tmp_clip, tmp_clip2
    While, tmp_clip <> tmp_clip2
        Sleep, 10 ;restoration not yet finished
    tmp_clip := ClipboardAll ; preserve Clipboard
    ClipBoard := text
    While, tmp_clip2 <> text        
        tmp_clip2 := ClipBoard ;validate clipboard
    Send, ^v
    SetTimer, restoration, -500
    Return ;don't waste time waiting for restoration
    restoration:
    ClipBoard := tmp_clip ; restore the clipboard
    While, tmp_clip <> tmp_clip2        
        tmp_clip2 := ClipBoardAll ;validate clipboard
    tmp_clip:="", tmp_clip2:=""
    Return
}