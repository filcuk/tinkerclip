; TODO: Add filter (by description, category)

InsertCharGUI(Category) {
    CharGUI := Gui("+AlwaysOnTop +ToolWindow", "TinkerClip - Insert")
    CharGUI.SetFont("s9 q5", "Segoe UI")
    CharGUI.OnEvent("Escape", CharGUI_Escape)
    
    ; Setup ListView
    CharLV := CharGUI.AddListView("r26 w540", ["ID", "Hex", "Symbol", "Description", "Category"])
    CharLV.OnEvent("DoubleClick", CharLV_DoubleClick)
    CharLV.Name := "LV"
    
    ; ; Add button enabling confirm using kbd
    ; CharBtn := CharGUI.AddButton("Default", "Insert").OnEvent("Click", CharBtn_Click)

    ; Select char group
    Switch Category, False {
        Case "symb":
            File := "Res\CharSymbol.csv"
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

CharGUI_Escape(Obj) {
    Obj.Destroy()
}

; CharBtn_Click(*) {
;     LV := CharBtn.Gui["LV"]
;     Row := LV.GetNext()

;     CharBtn.Gui.Destroy()
;     If (Row > 0) {
;         Char := LV.GetText(Row, 3)
;         SendInput(Char)
;     }
; }

CharLV_DoubleClick(LV, Row) {
    ; Retrieve symbol, close GUI and insert symbol
    Char := LV.GetText(Row, 3)
    
    LV.Gui.Destroy()
    SendInput(Char)
}