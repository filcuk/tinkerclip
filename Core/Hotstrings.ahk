; === OPTIONS =============================================
; *     Ending character is not required
; *0    Ending character is required (default)
; ?     Hotstring will trigger even when inside another word
; ?0
; B     Automatic backspacing on (default)
; B0    Automatic backspacing off
; C     Case sensitivity on
; C0    Case sensitivity/non-conformance off (default)
; C1    Case non-conformance (hoststring doesn't follow typed case)
; Kn    Set delay between keystrokes in ms (ignored by SendInput)
; O     Omit ending character
; Pn    Priority (no effect on auto-replace hotstrings)
; R     Send replacement text raw (no special key translation)
; S     Exempt hotstring from Suspend
; S0    Remove exemption (default)
; SI    Use SendInput (default)
; SE    Use SendEvent
; SP    Use SendPlay
; T     Use Text mode
; X     Execute (e.g. function)
; Z     Reset hotstring recogniser after each trigger
; Z0    Disable recogniser reset on trigger (default)

#Hotstring EndChars `n `t ,
; #Hotstring C

:*X:unit@::InsertCharGUI("unit")
:*X:math@::InsertCharGUI("math")
:*X:symb@::InsertCharGUI("symb")
:*X:clip@::Send("{Raw}" . A_Clipboard)

; === HACKS =====================================
:*:pbiinvis@::{U+00AD}	; (soft hyphen) - invisible but not truncated in Power BI

; === TIME CONVERSION ===========================
; Planview
; Open gui with hr & min input, which enters minutes on confirmation
; #HotIf WinActive("Report Time")
; ::btw::This replacement text will appear only in Notepad.
; #HotIf

; === Power Query ===============================
:*:int@::Int64.Type

; === SHORTHAND =================================
:*:msa@::MS Access
:*:mse@::MS Excel
:*:pbi@::Power BI
:*:pat@::Power Automate
:*:pap@::Power Apps
::br::Best Regards
::kr::Kind Regards
::mt::Many Thanks
; :*:ref@::Related:{Enter}-{Space}

; === UI ========================================
; :*:avg@::x̄
:*:avg@::Ø
:*:diff@::{U+0394}	; Δ (delta)
:*:sum@::{U+2211} ; ∑ (sum)
:*:cnt@::#

; === DATE & TIME ===============================
:*X:timestamp@::	SendInput(FormatTime(A_Now, "yyyyMMddHHmmss"))
:*X:date@::   		SendInput(FormatTime(A_Now, "yyyy-MM-dd"))
:*X:time@::			SendInput(FormatTime(A_Now, "HH:mm"))
:*X:nowiso@::		SendInput(FormatTime(A_Now, "yyyy-MM-dd HH:mm"))
:*X:now@::			SendInput(FormatTime(A_Now, "dd/MM/yyyy HH:mm"))
:*X:scr@::			SendInput("Screenshot " . FormatTime(A_Now, "yyyy-MM-dd HHmmss"))

; === MISC UNITS =====================================
:*C1:co2::CO{U+2082}   ; CO₂
:*C1:ch4::CH{U+2084}   ; CH₄
:*C1:n2o::N{U+2082}O   ; N₂O

; === UNITS =====================================
:*:dg@::{U+00B0}    ; °
:*:dgc@::{U+2103}   ; ℃
:*:dgf@::{U+2109}   ; ℉
:*:dgk@::{U+212A}   ; K
:*:um@::{U+00B5}m   ; µ

; === MISC ======================================
::(c)::{U+00A9}		; ©
::(r)::{U+00AE}		; ®
:*:.@::{U+00B7}		; · (middle dot)
:*:-@::{U+2022}		; • (bullet)
:*:>@::{U+2023}		; ‣ (triangular bullet)
:*:-2@::{U+2013}	; – (en dash)
:*:-3@::{U+2014}	; — (em dash)
:*:8@::{U+29D6}		; ⧖ (white hourglass)
:*:RTL@::{U+202E}   ; LOL

; === ARROWS ====================================
:*:<-@::{U+2190}		; ←
:*:->@::{U+2192}		; →
:*:/\@::{U+2191}		; ↑
:*:\/@::{U+2193}		; ↓
:*:<<@::{U+00AB}		; «
:*:>>@::{U+00BB}		; »

:*:lra@::{U+2194}	; ↔
:*:uda@::{U+2195}	; ↕
:*:nwa@::{U+2196}	; ↖
:*:nea@::{U+2197}	; ↗
:*:sea@::{U+2198}	; ↘
:*:swa@::{U+2199}	; ↙

; === BALLOT ====================================
:*:[v]@::{U+1F5F9}	; 🗹
:*:[x]@::{U+2612}   ; ☒
:*:[ ]@::{U+2610}	; ☐
:*:v@::{U+2713}		; ✓
:*:x@::{U+2717}		; ✗

; === REFERENCE =================================
; === superscript ===============================
:*:^0::{U+2070}		; ⁰
:*:^1::{U+00B9}		; ¹
:*:^2::{U+00B2}		; ²
:*:^3::{U+00B3}		; ³
:*:^4::{U+2074}		; ⁴
:*:^5::{U+2075}		; ⁵
:*:^6::{U+2076}		; ⁶
:*:^7::{U+2077}		; ⁷
:*:^8::{U+2078}		; ⁸
:*:^9::{U+2079}		; ⁹
:*:^+::{U+207A}		; ⁺
:*:^-::{U+207B}		; ⁻
:*:^=::{U+207C}		; ⁼
:*:^(::{U+207D}		; ⁽
:*:^)::{U+207E}		; ⁾
:*:^n::{U+207F}		; ⁿ

; === subscript ===============================
:*:¬0::{U+2080}		; ₀
:*:¬1::{U+2081}		; ₁
:*:¬2::{U+2082}		; ₂
:*:¬3::{U+2083}		; ₃
:*:¬4::{U+2084}		; ₄
:*:¬5::{U+2085}		; ₅
:*:¬6::{U+2086}		; ₆
:*:¬7::{U+2087}		; ₇
:*:¬8::{U+2088}		; ₈
:*:¬9::{U+2089}		; ₉
:*:¬+::{U+208A}		; ₊
:*:¬-::{U+208B}		; ₋
:*:¬=::{U+208C}		; ₌
:*:¬(::{U+208D}		; ₍
:*:¬)::{U+208E}		; ₎
; :*:a::{U+2090}		; 
; :*:e::{U+2091}		; 
; :*:o::{U+2092}		; 
; :*:x::{U+2093}		; 
; :*:::{U+2094}		; ₔ

; === other =====================================
:*:^t::{U+2020}		; †
:*:^t2::{U+2021}	; ‡

; === MATH ======================================
; https://unicode-table.com/en/sets/mathematical-signs/
:*:=/=::{U+2260}    ; ≠ (not equal)
:*:^/::{U+00F7}		; ÷ (division sign)
:*:^x::{U+00D7}		; × (multiplication sign)
:*:^*::{U+2217}		; ∗ (asterisk operator)

; :*:-/+::{U+2213}	; ∓ (minus-or-plus sign)
:*:+/-::{U+00B1}	; ± (plus minus sign)
:*:<=::{U+2264}     ; ≤ (less-than or equal to)
:*:>=::{U+2265}     ; ≥ (greater-than or equal to)
:*:~~::{U+2248}     ; ≈ (almost equal to)
:*:-~::{U+2242}	    ; ≂ (minus tilde)
:*:~-::{U+2248}     ; ≃ (asymptotically equal to)
:*:~=::{U+2248}     ; ≅ (approximately equal to)
:* C:^E::{U+2211}   ; ∑ (sum)
:*:^d::{U+0394}		; Δ (delta)

::1/4::{U+00BC}		; ¼
::1/2::{U+00BD}		; ½
::3/4::{U+00BE}		; ¾

; Restore default behaviour
#Hotstring *0 ?0 C0 Z0 O0

; Markdown URL source inserter
:* X:source@::SendInstant(MD_SourceLink(A_Clipboard))
:* X:sourcef@::SendInstant("Source: " . MD_SourceLink(A_Clipboard))

:* X:jira@::SendInstant(LinkParser_JiraIssueToMD(A_Clipboard))
; :* X:jira#::SendInstant(LinkParser_JiraIssueToHTML(A_Clipboard))