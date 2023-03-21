; Markdown Source Link
; -----------------------------------------------
; Returns MD formatted link using domain as the name
MD_SourceLink(URL) {
    RegExMatch(URL, "^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)(?)", &Out)
    Str := "[" Out[1] "](" URL ")"
    Return(Str)
}