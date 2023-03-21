; TODO: Add filter (by description, category)

InsertCharGUI(Category) {
    CharGUI := Gui("+AlwaysOnTop +ToolWindow", "TinkerClip - Insert")
    CharGUI.SetFont("s9 q5", "Segoe UI")
    
    ; Setup ListView
    CharLV := CharGUI.AddListView("r26 w540", ["ID", "Hex", "Symbol", "Description", "Category"])
    CharLV.OnEvent("DoubleClick", CharLV_DoubleClick)
    
    ; Select char group
    Switch Category, False {
        Case "unit":
            File := "Res\CharUnit.csv"
        Case "math":
            File := "Res\CharMath.csv"
    }

    ; Parse from file
    ID := 0
    Loop Read File {
        Field := Array()
        Loop Parse A_LoopReadLine, "CSV" {
            Field.Push A_LoopField
        }
        ID += 1
        CharLV.Add(, ID, Field[1], Field[2], Field[3], Field[4])
    }

    CharLV.ModifyCol()               ; Autofit columns
    CharLV.ModifyCol(1, "Integer")   ; For sorting purposes

    CharGUI.Show()

}

CharLV_DoubleClick(LV, Row) {
    ; Retrieve symbol, close GUI and insert symbol
    Char := LV.GetText(Row, 3)
    LV.Gui.Destroy()
    SendInput(Char)
}