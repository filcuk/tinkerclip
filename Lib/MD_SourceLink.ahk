; Markdown Source Link
; -----------------------------------------------
; Returns MD formatted link using domain as the name
MD_SourceLink(URL) {
    RegExMatch(URL, "^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)(?)", &Out)
    Str := "[" Out[1] "](" URL ")"
    Return(Str)
}

; Jira issue link
; ------------------------------------------------
; Example:  https://domain.atlassian.net/browse/IT-789
; Output:   [IT-789](https://domain.atlassian.net/browse/IT-789)
LinkParser_JiraIssueToMD(URL) {
    RegExMatch(URL, "^(?:https:\/\/xpo-xet.atlassian.net\/browse\/)?(.*)?", &Out)
    Str := "[" Out[1] "](" URL ")"
    Return(Str)
}

;; Not working... insert as HTML to Teams directly
; LinkParser_JiraIssueToHTML(URL) {
;     RegExMatch(URL, "^(?:https:\/\/xpo-xet.atlassian.net\/browse\/)?(.*)?", &Out)
;     Str := "<a href=`"" URL "`">" Out[1] "</a>"

;     htmlFile := ComObject("HTMLfile")
;     htmlFile.write(Str)
;     ;htmlFile.body.createTextRange().execCommand("Copy")
;     Return(htmlFile.body)
; }