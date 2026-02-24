; Takes HEX colour from clipboard, populates Windows colour dialog using RGB
; == PARAMETERS ==============
WinTitle := "Colour"   	; Window title to activate
; ClickX   := 160         	; X position inside the window (relative to window)
; ClickY   := 120         	; Y position inside the window (relative to window)
; ============================

; Ctrl + Alt + C
^!f::
{
    oldClip := A_Clipboard  ; Save current clipboard
    try {
        text := A_Clipboard
        if !IsSet(text) || text = ""
        {
            Notify("Clipboard is empty.", 1500)
            return
        }

        ; Normalize input (trim, lowercase)
        text := Trim(text)
        if (SubStr(text, 1, 1) = "#")
            text := SubStr(text, 2)

        ; Validate HEX format: either 6 hex (RRGGBB) or 3 hex (RGB)
        if !RegExMatch(text, "^(?:[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$")
        {
            Notify("Clipboard doesn't contain a valid HEX color (e.g. #FFFFFF or #FFF).", 2500)
            return
        }

        ; Expand shorthand #RGB to #RRGGBB
        if (StrLen(text) = 3)
            text := SubStr(text,1,1) SubStr(text,1,1)
                  . SubStr(text,2,1) SubStr(text,2,1)
                  . SubStr(text,3,1) SubStr(text,3,1)

        rHex := SubStr(text, 1, 2)
        gHex := SubStr(text, 3, 2)
        bHex := SubStr(text, 5, 2)

        r := Integer("0x" rHex)
        g := Integer("0x" gHex)
        b := Integer("0x" bHex)

        ; Optional: brief tooltip confirmation
        ; Notify(Format("RGB: {1}, {2}, {3}", r, g, b), 1200)


        ; Find & activate the window
        hwnd := WinExist(WinTitle)
        if !hwnd {
            Notify("Window not found.", 2000)
            return
        }

        WinActivate "ahk_id " hwnd
        if !WinWaitActive("ahk_id " hwnd, , 1.5) {
            Notify("Couldn't activate window.", 2000)
            return
        }
		Sleep(200)

        ; Use alt nav to select R in RGB
		Send "!r"
		Sleep(100)

        ; Paste values with TAB in between
        ; Using SendText for literal text; adjust delays if your target app needs it
        ; Send "^a"
		; Sleep(100)
		SendText(r)
		Sleep(100)
        Send "{Tab}"
		Sleep(150)
        SendText(g)
		Sleep(100)
        Send "{Tab}"
		Sleep(150)
        SendText(b)
		Sleep(100)
		Send "{Tab}"
		Sleep(100)
		Send "{Tab}"
		Sleep(100)
		Send "{Enter}"	; Optionally confirm immediately

        ; If you want to confirm with Enter at the end, uncomment:
        ; Send "{Enter}"
    }
    finally {
        ; Restore original clipboard
        A_Clipboard := oldClip
    }
}

Notify(msg, ms := 1500) {
    ; ToolTip(msg)
    ; SetTimer (() => ToolTip()), -ms
	MsgBox(msg)
}