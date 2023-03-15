; https://www.autohotkey.com/docs/Hotstrings.htm
; https://www.autohotkey.com/docs/commands/Hotstring.htm

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

; TODO when tere's available autocomplete, pop up a message saying: press 'tab' to complete char x

#Hotstring EndChars -()[]{}':;"/\,.?!`n `t

; C - case sensitive
; Z - reset recogniser after each hotstring
#Hotstring C Z

::msa::MS Access
::mse::MS Excel
::pbi::Power BI

/*
#Hotstring Z0
::--::{U+2013}		; En Dash
::---::{U+2014}		; Em Dash	; DOESN@T OWKR
#Hotstring Z
*/

#Hotstring * X

::date@::       SendInput(FormatTime(A_Now, "yyyy-MM-dd"))
::time@::       SendInput(FormatTime(A_Now, "HH:mm"))
::stamp@::      SendInput(FormatTime(A_Now, "yyyy-MM-dd HH:mm"))
::scr@::        SendInput ("Screenshot " . FormatTime(A_Now, "yyyy-MM-dd hhmmss"))

#Hotstring X0

::dg@::     {U+00B0}
::dgc@::    {U+2103}
::dgf@::    {U+2109}

#Hotstring *0

; Markdown URL source inserter
::source@::
{
    URL := Clipboard
    RegExMatch(Clipboard, "O)" . "^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)(?)", Out) ; "O)" = AHK object mode
    Out := "[" . Out[1] . "](" . URL . ")"
    ; SendInput % Out   ; Can be too slow
    PasteThis(Out)
}

::(c)::{U+00A9}		; ©
::(r)::{U+00AE}		; ®

::<<::{U+00AB}		; «
::>>::{U+00BB}		; »

; Unicode - Simple arrows
::<-::{U+2190}		; ←
::/\::{U+2191}		; ↑
::->::{U+2192}		; →
::\/::{U+2193}		; ↓
;::<>::{U+2194}		; Left Right Arrow
;::::{U+2195}		; Up Down Arrow
;::::{U+2196}		; North West Arrow
;::::{U+2197}		; North East Arrow
;::::{U+2198}		; South East Arrow
;::::{U+2199}		; South West Arrow

::[v]::{U+1F5F9}	; 🗹
::[x]::{U+2612}		; ☒
::[ ]::{U+2610}		; ☐

::v@::{U+2713}		; ✓
::x@::{U+2717}		; ✗

; https://unicode-table.com/en/sets/unit-symbols/
; TODO

; https://unicode-table.com/en/sets/mathematical-signs/
; Ligatures
::^x::{U+00D7}		; × (multiplication sign)

; Math
::=/=::{U+2260}		; ≠ (not equal)
::^/::{U+00F7}		; ÷
::^*::{U+2217}		; ∗ (asterisk operator)


; ? - hostring will trigger even inside a word
#Hotstring ?
; ::^o::{U+00B0}		; °
::-+::{U+2213}		; ∓ (minus-or-plus sign)
::+-::{U+00B1}		; ± (plus minus symbol)
::-~::{U+2242}		; ≂ (minus tilde)
::^1::{U+00B9}		; ¹
::^2::{U+00B2}		; ²
::^3::{U+00B3}		; ³
::^E::{U+2211}      ; ∑

; * - trigger hostring without ending character
#Hotstring *0
::1/4::{U+00BC}		; ¼
::1/2::{U+00BD}		; ½
::3/4::{U+00BE}		; ¾

#Hotstring O


; Restore default behaviour
#Hotstring *0 ?0 C0 Z0 O0