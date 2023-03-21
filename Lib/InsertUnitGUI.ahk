InsertUnitGUI() {
    UnitGUI := Gui("+AlwaysOnTop +ToolWindow", "TinkerClip - Insert")

    FontNorm := "Segoe UI"
    FontNormC := "cDefault"
    FontMono := "Consolas"
    FontMonoC := "cBlue"

    UnitGUI.SetFont("s9 q5", FontNorm)
    UnitGUI.SetFont("bold")
    UnitGUI.Add("Text", "xm section", "Insert Unit Symbol")
    UnitGUI.SetFont("norm")

    UnitLV := UnitGUI.AddListView("r26 w440", ["ID", "Symbol", "Description", "Category"])
    UnitLV.OnEvent("DoubleClick", UnitLV_DoubleClick)

    ; Parse from file
    ID := 0
    Loop Read "Lib\UnitList.csv" {
        Field := Array()
        Loop Parse A_LoopReadLine, "CSV" {
            Field.Push A_LoopField
        }
        ID += 1
        UnitLV.Add(, ID, Field[1], Field[2], Field[3])
    }

    UnitLV.ModifyCol()               ; Autofit columns
    UnitLV.ModifyCol(1, "Integer")   ; For sorting purposes

    UnitGUI.Show()

}

UnitLV_DoubleClick(LV, Row) {
    ; Retrieve symbol, close GUI and insert symbol
    Char := LV.GetText(Row, 2)
    LV.Gui.Destroy()
    SendInput(Char)
}