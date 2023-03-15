; === VARS ================================================
TrayIdle := false

; === BUILD MENU ==========================================
TrayCfg := Menu()
TrayCfg.Add("Run on startup", TrayHandler)

Tray := A_TrayMenu
Tray.Delete()   ; Remove default items
Tray.Add("TinkerClip", TrayHandler)
Tray.Add("Config", TrayCfg)
Tray.Add()
Tray.Add("No &Idle", TrayHandler)
Tray.Add()
Tray.Add("&Suspend", TrayHandler)
Tray.Add("&Reload", TrayHandler)
Tray.Add("&Exit", TrayHandler)

; === DEFAULT STATES ======================================
Tray.Default := "&Reload" ; Used on tray icon LClick
Tray.ClickCount := 1       ; Clicks to trigger default action

Tray.Disable("TinkerClip")

; === ACTIONS =============================================
TrayHandler(Item, *) {
    Switch(Item) {
        Case "No &Idle":
            global TrayIdle
            
            Tray.ToggleCheck("No &Idle")
            TrayIdle := not TrayIdle
        
        Case "&Suspend":
            Tray.ToggleCheck("&Suspend")
            Suspend -1

        Case "&Reload": Reload()
        Case "&Exit": ExitApp()
        Default: MsgBox "Unhandled item: " Item
    }
}