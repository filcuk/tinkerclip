; Source: https://autohotkey.com/board/topic/37107-check-if-menu-item-is-checked/

IsTrayMenuChecked(MenuNameOrHandle, Position)
{
    static AlreadyDone, mii
    
    if (!AlreadyDone)
    {
        AlreadyDone := true
        VarSetCapacity(mii, 48, 0), NumPut(48, mii), NumPut(1, mii, 4)
    }

    if MenuNameOrHandle is integer
        hMenu := MenuNameOrHandle
    else
        hMenu := MI_GetMenuHandle(MenuNameOrHandle)

    DllCall("GetMenuItemInfo"
        , "uint", hMenu
        , "uint", Position - 1
        , "uint", 0x400         ;MF_BYPOSITION
        , "uint", &mii)
        
    ;MFS_CHECKED = 0x8
    return NumGet(mii, 12) & 0x8
}

;Copied directly from Lexikos' menu icons version 2.2

; Gets a menu handle from a menu name.
; Adapted from Shimanov's Menu_AssignBitmap()
;   http://www.autohotkey.com/forum/topic7526.html
MI_GetMenuHandle(menu_name)
{
    static   h_menuDummy
    ; v2.2: Check for !h_menuDummy instead of h_menuDummy="" in case init failed last time.
    If !h_menuDummy
    {
        Menu, menuDummy, Add
        Menu, menuDummy, DeleteAll

        Gui, 99:Menu, menuDummy
        ; v2.2: Use LastFound method instead of window title. [Thanks animeaime.]
        Gui, 99:+LastFound

        h_menuDummy := DllCall("GetMenu", "uint", WinExist())

        Gui, 99:Menu
        Gui, 99:Destroy

        ; v2.2: Return only after cleaning up. [Thanks animeaime.]
        if !h_menuDummy
            return 0
    }

    Menu, menuDummy, Add, :%menu_name%

    h_menu := DllCall( "GetSubMenu", "uint", h_menuDummy, "int", 0 )

    DllCall( "RemoveMenu", "uint", h_menuDummy, "uint", 0, "uint", 0x400)
    Menu, menuDummy, Delete, :%menu_name%

    return h_menu
}