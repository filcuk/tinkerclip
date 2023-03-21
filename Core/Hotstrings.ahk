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

#Hotstring EndChars `n `t
#Hotstring C

; === SHORTHAND =================================
::msa::MS Access
::mse::MS Excel
::pbi::Power BI

; === DATE & TIME ===============================
:* X:date@::   SendInput(FormatTime(A_Now, "yyyy-MM-dd"))
:* X:time@::   SendInput(FormatTime(A_Now, "HH:mm"))
:* X:now@::    SendInput(FormatTime(A_Now, "yyyy-MM-dd HH:mm"))
:* X:scr@::    SendInput("Screenshot " . FormatTime(A_Now, "yyyy-MM-dd HHmmss"))

; === UNITS =====================================
:*:dg@::{U+00B0}    ; °
:*:dgc@::{U+2103}   ; ℃
:*:dgf@::{U+2109}   ; ℉
:*:dgk@::{U+212A}   ; K

:* X:unit@::InsertUnitGUI()

; === MISC ======================================
::(c)::{U+00A9}		; ©
::(r)::{U+00AE}		; ®
:*:.@::{U+00B7}		; · (middle dot)
:*:-@::{U+2022}		; • (bullet)
:*:>@::{U+2023}		; ‣ (triangular bullet)
:*:-2@::{U+2013}	; – (en dash)
:*:-3@::{U+2014}	; — (em dash)

; === ARROWS ====================================
:*:<-::{U+2190}		; ←
:*:->::{U+2192}		; →
:*:/\::{U+2191}		; ↑
:*:\/::{U+2193}		; ↓
:*:<<::{U+00AB}		; «
:*:>>::{U+00BB}		; »

:*:lra@::{U+2194}	; ↔
:*:uda@::{U+2195}	; ↕
:*:nwa@::{U+2196}	; ↖
:*:nea@::{U+2197}	; ↗
:*:sea@::{U+2198}	; ↘
:*:swa@::{U+2199}	; ↙

; === BALLOT ====================================
:*:[v]::{U+1F5F9}	; 🗹
:*:[x]::{U+2612}    ; ☒
:*:[ ]::{U+2610}	; ☐
:*:v@::{U+2713}		; ✓
:*:x@::{U+2717}		; ✗

; === REFERENCE =================================
::^1::{U+00B9}		; ¹
::^2::{U+00B2}		; ²
::^3::{U+00B3}		; ³
::^t::{U+2020}		; †
::^2t::{U+2021}		; ‡

; === MATH ======================================
; https://unicode-table.com/en/sets/mathematical-signs/
:*:=/=::{U+2260}    ; ≠ (not equal)
:*:^/::{U+00F7}		; ÷ (division sign)
:*:^x::{U+00D7}		; × (multiplication sign)
:*:^*::{U+2217}		; ∗ (asterisk operator)

; :*:-/+::{U+2213}	; ∓ (minus-or-plus sign)
:*:+/-::{U+00B1}	; ± (plus minus sign)
:*:~~::{U+2248}     ; ≈ (almost equal to)
; ::-~::{U+2242}	  ; ≂ (minus tilde)
; ::~-::{U+2248}      ; ≃ (asymptotically equal to)
; ::~=::{U+2248}      ; ≅ (approximately equal to)
:* C:^E::{U+2211}   ; ∑ (sum)

::1/4::{U+00BC}		; ¼
::1/2::{U+00BD}		; ½
::3/4::{U+00BE}		; ¾

::^d::{U+0394}		; Δ (delta)

; Restore default behaviour
#Hotstring *0 ?0 C0 Z0 O0

; Markdown URL source inserter
; TODO: Fix RegEx function
:*:source@:: {
    URL := A_Clipboard
    RegExMatch(A_Clipboard, "^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)(?)", &Out)
    Out := "[" Out[1] "](" URL ")"
    ; SendInput % Out   ; Can be too slow
    PasteThis(Out)
}