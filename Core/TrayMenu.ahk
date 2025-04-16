; === INIT ================================================
AutoStartLnk := A_Startup . "\TinkerClip.lnk"
AutoStart := (False Or FileExist(AutoStartLnk))
TrayIdle := True
Suspended := False
AppWinKey := True

; === MENU ITEMS ==========================================


; === BUILD MENU ==========================================
TrayCfg := Menu()
TrayCfg.Add("Run on startup", TrayHandler)

Tray := A_TrayMenu
Tray.Delete()   ; Remove default items
Tray.Add("TinkerClip", TrayHandler)
Tray.Add("&Config", TrayCfg)
; Tray.Add("&Options", TrayOpt)
Tray.Add("&Help", TrayHandler)
Tray.Add()
Tray.Add("No &Idle", TrayHandler)
Tray.Add("App → &Win key", TrayHandler)
Tray.Add()
Tray.Add("&Suspend", TrayHandler)
Tray.Add("&Reload", TrayHandler)
Tray.Add("&Exit", TrayHandler)

; === DEFAULT STATES ======================================
Tray.Default := "&Reload" ; Used on tray icon LClick
Tray.ClickCount := 1       ; Clicks to trigger default action
Tray.Disable("TinkerClip")

; SwitchSuspend(Suspended)
SwitchIdle(TrayIdle)
SwitchAutoStart(AutoStart)
SwitchAppWinKey(AppWinKey)

; === ACTIONS =============================================
TrayHandler(Item, *) {
    Switch(Item) {
        Case "&Help": KeyGUI.Show()
        Case "Run on startup": SwitchAutoStart(Not AutoStart)
        Case "No &Idle": SwitchIdle(Not TrayIdle)
        Case "App → &Win key": SwitchAppWinKey(Not AppWinKey)
        Case "&Suspend": SwitchSuspend(Not Suspended)
        Case "&Reload": Reload()
        Case "&Exit": ExitApp()
        Default: MsgBox "Unhandled item: " . Item
    }
}

SwitchSuspend(State) {
    Global Suspended
    
    Suspend(State)
    Suspended := State
    MenuToggleCheck(Tray, "&Suspend", A_IsSuspended)
}

SwitchIdle(State) {
    Global TrayIdle
    
    TrayIdle := State
    MenuToggleCheck(Tray, "No &Idle", State)
}

SwitchAppWinKey(State) {
    Global AppWinKey
    
    AppWinKey := State
    MenuToggleCheck(Tray, "App → &Win key", State)
}

SwitchAutoStart(State) {
    Global AutoStart
    Global AutoStartLnk

    If (State)
        FileCreateShortcut(A_ScriptFullPath, AutoStartLnk)
    Else
        If (FileExist(AutoStartLnk))
            FileDelete(AutoStartLnk)

    AutoStart := State
    MenuToggleCheck(TrayCfg, "Run on startup", State)
}

MenuToggleCheck(MenuObj, Item, State) {
    If (State)
        MenuObj.Check(Item)
    Else
        MenuObj.Uncheck(Item)
}