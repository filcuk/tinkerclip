
; Use clipboard to instantly insert text instead of sending individual keystrokes
; Saves and restores initial clipboard content
; https://www.autohotkey.com/boards/viewtopic.php?p=483549&sid=c8136c2ed3bf174201b1ec5c72d1ffb7#p483549

; TODO: Fix this! Original doesn't seem to work in v2
PasteThis(Text) {
    Static Clip, Tmp

    ; Wait for restoration to finish
    While (Clip != Tmp)
        Sleep(10)

    ; Preserve clipboard
    Clip := ClipboardAll
    Clipboard := Text
    
    ; Validate clipboard
    While (Tmp != Text)
        Tmp := Clipboard

    Send "^v"

    Clipboard := Clip
    ; While ()
}