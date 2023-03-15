TrayIdle := false

Tray := A_TrayMenu
Tray.Delete()   ; Remove default items
Tray.Add("No &Idle", TrayHandler)
Tray.Add()
Tray.Add("&Reload", TrayHandler)
Tray.Add("&Exit", TrayHandler)

TrayHandler(Item, *) {
    Switch(Item) {
        Case "No &Idle":
            Tray.ToggleCheck("No &Idle")
            global TrayIdle
            If (TrayIdle) {
                TrayIdle := false
            } Else {
                TrayIdle := true
            }
        Case "&Reload":
            Reload()
        Case "&Exit":
            ExitApp()
    }
}