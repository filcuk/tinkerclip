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
            global TrayIdle
            
            Tray.ToggleCheck("No &Idle")
            TrayIdle := not TrayIdle
        
        Case "&Reload": Reload()
        Case "&Exit": ExitApp()
    }
}