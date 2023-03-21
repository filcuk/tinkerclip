KeyGUI := Gui("+AlwaysOnTop +ToolWindow", "TinkerClip - Help")

FontNorm := "Segoe UI"
FontNormC := "cDefault"
FontMono := "Consolas"
FontMonoC := "cBlue"

KeyGUI.SetFont("s9 q5", FontNorm)
KeyGUI.SetFont("bold")
KeyGUI.Add("Text", "xm section", "Hotkeys/Hotstrings")
KeyGUI.SetFont("norm")

KeyLV := KeyGUI.AddListView("r26 w620", ["ID", "Input", "Output", "Description", "Group", "Category"])

ID := 0
Loop Read "Core\KeyList.csv" {
    Field := Array()
    Loop Parse A_LoopReadLine, "CSV" {
        Field.Push A_LoopField
    }
    ID += 1
    KeyLV.Add(, ID, Field[1], Field[2], Field[3], Field[4], Field[5])
}

KeyLV.ModifyCol()               ; Autofit columns
KeyLV.ModifyCol(1, "Integer")   ; For sorting purposes