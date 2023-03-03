; https://www.autohotkey.com/docs/Hotstrings.htm
; https://www.autohotkey.com/docs/commands/Hotstring.htm

; TODO 
; when tere's available autocomplete, pop up a message saying: press 'tab' to complete char x

; C - case sensitive
; Z - reset recogniser after each hotstring
#Hotstring C Z

::msa::MS Access
::mse::MS Excel

/*
#Hotstring Z0
::--::{U+2013}		; En Dash
::---::{U+2014}		; Em Dash	; DOESN@T OWKR
#Hotstring Z
*/

; Omit ending character
#Hotstring O
::date@::
FormatTime, TimeStr, A_Now, yyyy-MM-dd
SendInput % TimeStr
return

::time@::
FormatTime, TimeStr, A_Now, HH:mm
SendInput % TimeStr
return

::tstamp@::
FormatTime, TimeStr, A_Now, yyyy-MM-dd HH:mm
SendInput % TimeStr
return

::scr@::
FormatTime, TimeStr, A_Now, yyyy-MM-dd hhmmss
SendInput % "Screenshot " . TimeStr
return

::deg::{U+00B0}
::degc::{U+2103}
::degf::{U+2109}

#Hotstring O0

; * - trigger hostring without ending character
#Hotstring *

::source@:: ; Markdown URL source inserter
URL := Clipboard
RegExMatch(Clipboard, "O)" . "^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)(?)", Out) ; "O)" = AHK object mode
Out := "[" . Out[1] . "](" . URL . ")"
; SendInput % Out   ; Can be too slow
PasteThis(Out)
return

::(c)::{U+00A9}		; �
::(r)::{U+00AE}		; �

::<<::{U+00AB}		; �
::>>::{U+00BB}		; �

; Unicode - Simple arrows
::<-::{U+2190}		; Leftwards Arrow
::/\::{U+2191}		; Upwards Arrow
::->::{U+2192}		; Rightwards Arrow
::\/::{U+2193}		; Downwards Arrow
;::<>::{U+2194}		; Left Right Arrow
;::::{U+2195}		; Up Down Arrow
;::::{U+2196}		; North West Arrow
;::::{U+2197}		; North East Arrow
;::::{U+2198}		; South East Arrow
;::::{U+2199}		; South West Arrow

::[v]::{U+1F5F9}	; Ballot Box with Bold Check
::[x]::{U+2612}		; Ballot Box with X
::[ ]::{U+2610}		; Ballot Box

::v@::{U+2610}		; Check Mark
::x@::{U+2717}		; Ballot X

; https://unicode-table.com/en/sets/unit-symbols/
; TODO

; https://unicode-table.com/en/sets/mathematical-signs/
; Ligatures
::^x::{U+00D7}		; × (multiplication sign)

; Math
::=/=::{U+2260}		; Doesn't equal
::^/::{U+00F7}		; ÷
::^*::{U+2217}		; ∗ (asterisk operator)


; ? - hostring will trigger even inside a word
#Hotstring ?
::^o::{U+00B0}		; °
::-+::{U+2213}		; ∓ (minus-or-plus sign)
::+-::{U+00B1}		; ± (plus minus symbol)
::-~::{U+2242}		; ≂ (minus tilde)
::^1::{U+00B9}		; ¹
::^2::{U+00B2}		; ²
::^3::{U+00B3}		; ³
::^E::{U+2211}      ; ∑

; * - trigger hostring without ending character
#Hotstring *0
::1/4::{U+00BC}		; �
::1/2::{U+00BD}		; �
::3/4::{U+00BE}		; �

#Hotstring O


; Restore default behaviour
#Hotstring *0 ?0 C0 Z0 O0