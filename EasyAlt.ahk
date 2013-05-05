; Easy-Alt Typography (EAT v1.0)
; Easily enter proper typographical symbols and characters, anywhere.
; Originally written by Mark R. Gollnick <mark.r.gollnick@gmail.com> &#10013;
; Inspired by Dmitry Ivanov's closed project, windows_typographic_hotkeys
; Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)


; AutoHotKey Initialization

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global SupportedChars := "supported.txt" ; Supported chars. KEEP UP-TO-DATE.


; ============================================================================+
; Private Helper Functions :::::::::::::::::::::::::::::::::::::::::::::::::::|
; ============================================================================+

CharacterCarousel(Carousel)
{
    ; Initialize the clipboard
    Clipboard = ; null
    Send, {Ctrl down}c{Ctrl up}
    ClipWait, 0.2 ; 200 milliseconds to initialize the clipboard
    
    ; Read the pseudo-array
    max_index = 0
    Loop, Parse, Carousel, " "
    {
        max_index += 1
        Array_%max_index% := A_LoopField
    }
    
    ; Search the pseudo-array
    index = 0
    Loop, %max_index%
    {
        index += 1
        Element := Array_%index%
        if Clipboard = %Element%
            break
    }
    
    ; Loop back to the first item, in case not found
    max_index += 1
    Array_%max_index% := Array_1
    
    ; Return the next character in the carousel to print
    index += 1
    Element := Array_%index%
    return, Element
}

PrintNextChar(CharList)
{
    ; Decide which character to print
    Character := CharacterCarousel(CharList)
    ; Print the selected character
    Send, %Character%
    ; Highlight the newly printed character
    Send, {Shift down}{Left}{Shift up}
    return
}

IsSupportedChar(Char)
{
    returning = False ; Assume no
    
    ; This is incredibly inefficient. It reads from the disk every single time...
    max_index = 0
    Loop, Read, %A_ScriptDir%/%SupportedChars%
    {
        max_index += 1
        Supported_%max_index% := A_LoopReadLine
    }
    
    ; Search for the character in the pseudo-array
    index = 0
    Loop, %max_index%
    {
        index += 1
        Element := Supported_%index%
        if Char = %Element%
        {
            returning = True ; Found it!
            break
        }
    }
    
    return, returning
}

DeselectPrintedChar()
{
    ; Initialize the clipboard
    Clipboard = ; null
    Send, {Ctrl down}c{Ctrl up}
    ClipWait, 0.2 ; 200 milliseconds to initialize the clipboard
    
    ; Decide if the selected character is one of the supported characters.
    Value := IsSupportedChar(Clipboard)
    if Value = True
    {
        Send, {Right} ; If it's most likely a character we typed, deselect it.
        Clipboard = ; null
    }
}


; ============================================================================+
; THE HOTKEYS ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::|
; ============================================================================+
; 
; Note that: 
;            ^ = Ctrl ,
;            ! = Alt ,
;            + = Shift ,
;            # = Windows Key ,
;                             ...in all of the combinations below.
; 

~$Alt Up::DeselectPrintedChar() ; Deselects last char on ALT release.

; Alt + a
!a::PrintNextChar("å á à â ã ä")
; Alt + e
!e::PrintNextChar("é è ê ë")
; Alt + i
!i::PrintNextChar("î í ì ï")
; Alt + o
!o::PrintNextChar("ø ó ò ô õ ö")
; Alt + u
!u::PrintNextChar("ü ú ù û")
; Alt + y
!y::PrintNextChar("¥ ÿ")

; Alt + Shift + A
!+A::PrintNextChar("Å Á À Â Ã Ä")
; Alt + Shift + E
!+E::PrintNextChar("É È Ê Ë")
; Alt + Shift + I
!+I::PrintNextChar("Î Í Ì Ï")
; Alt + Shift + O
!+O::PrintNextChar("Ø Ó Ò Ô Õ Ö")
; Alt + Shift + U
!+U::PrintNextChar("Ü Ú Ù Û")
; Alt + Shift + Y
!+Y::PrintNextChar("Ÿ Á")


; a is above
!b::PrintNextChar("†") ; dagger
!c::PrintNextChar("ç")
!d::PrintNextChar("ð") ; lowercast eth (Icelandic) (NONSTANDARD)
; e is above
!f::PrintNextChar("ƒ")
!g::PrintNextChar("©") ; copyright symbol
!h::PrintNextChar("™") ; trademark symbol
; i is above
; j is null
!k::PrintNextChar("š")
!l::PrintNextChar("¬") ; not symbol (logical negation)
!m::PrintNextChar("µ") ; lowercase mu (Greek), the SI "micro" prefix
!n::PrintNextChar("ñ")
; o is above
!p::PrintNextChar("¼")
!q::PrintNextChar("œ")
!r::PrintNextChar("®") ; registered trademark symbol
!s::PrintNextChar("ß")
!t::PrintNextChar("† Ý") ; #1 is dagger
; u is above
!v::PrintNextChar("ˆ") ; circumflex
!w::PrintNextChar("…") ; ellipses
!x::PrintNextChar("‰") ; per mil
; y is above
!z::PrintNextChar("‡") ; dagger (variant)


; A is above
!+B::PrintNextChar("¹") ; superscript one
!+C::PrintNextChar("Ç")
!+D::PrintNextChar("Î Ð") ; #2 is uppercase Eth (Icelandic) (NONSTANDARD)
; E is above
!+F::PrintNextChar("Ï")
!+G::PrintNextChar("›") ; guillemets (angle quotes)
!+H::PrintNextChar("Ó")
; I is above
!+J::PrintNextChar("Ô")
!+K::PrintNextChar("•") ; bullet
!+L::PrintNextChar("Ò")
!+M::PrintNextChar("Â")
!+N::PrintNextChar("Ñ")
; O is above
!+P::PrintNextChar("½")
!+Q::PrintNextChar("Œ")
!+R::PrintNextChar("‰") ; per mil
!+S::PrintNextChar("Í")
; T is null
; U is above
!+V::PrintNextChar("×") ; multiplication sign
!+W::PrintNextChar("„") ; opening primary quotation marks (German)
                        ; closing primary quotation marks (Hebrew)
!+X::PrintNextChar("œ")
; Y is above
; Z is null


!0::PrintNextChar("º") ; ordinal indicator (masculine)
!1::PrintNextChar("¡ ¬") ; #1: inverted exclamation mark
                         ; #2: not symbol (logical negation)
!2::PrintNextChar("™") ; trademark symbol
!3::PrintNextChar("£") ; pound sign
!4::PrintNextChar("¢") ; cent sign
!5::PrintNextChar("ƒ")
!6::PrintNextChar("§") ; section sign
!7::PrintNextChar("¶") ; pilcrow (paragraph mark)
!8::PrintNextChar("•") ; bullet
!9::PrintNextChar("ª") ; ordinal indicator (feminine)
!-::PrintNextChar("–") ; en dash
!=::PrintNextChar("‚") ; opening secondary quotation mark (German)
                       ; closing secondary quotation mark (Hebrew)
![::PrintNextChar("“") ; opening primary quotation marks (US English)
                       ; opening secondary quotation marks (UK English)
                       ; closing primary quotation marks (German)
!]::PrintNextChar("‘") ; opening secondary quotation mark (US English)
                       ; opening primary quotation mark (UK English)
                       ; closing secondary quotation mark (German)
!\::PrintNextChar("« ´") ; #1: left guillemets (angle quotes) (French)
                         ; #2: acute accent
!'::PrintNextChar("æ")
!,::PrintNextChar("¾")
!.::PrintNextChar("„") ; opening primary quotation marks (German)
                       ; closing primary quotation marks (Hebrew)
!;::PrintNextChar("…") ; ellipses
; ` is null
!/::PrintNextChar("÷") ; obelus (division sign)


!+0::PrintNextChar("‚") ; opening secondary quotation mark (German)
                        ; closing secondary quotation mark (Hebrew)
!+1::PrintNextChar("Ž")
!+2::PrintNextChar("€ ½") ; #1: euro sign
                          ; #2: one-half (NONSTANDARD)
!+3::PrintNextChar("‹ Ð ⅓ ⅔") ; #1: left guillemet (angle quote) (French)
                              ; #2: uppercase Eth (Icelandic) (nonstandard?)
                              ; #3: one-third (NONSTANDARD)
                              ; #4: two-thirds (NONSTANDARD)
!+4::PrintNextChar("› ð ¼ ¾") ; #1: right guillemet (angle quote) (French)
                              ; #2: lowercast eth (Icelandic) (nonstandard?)
                              ; #3: one-fourth (NONSTANDARD)
                              ; #4: three-fourths (NONSTANDARD)
!+5::PrintNextChar("Þ") ; capital thorn (Old English letter)
!+6::PrintNextChar("þ") ; lowercase thorn (Old English letter)
!+7::PrintNextChar("‡ ý") ; #1 is daggar (variant)
!+8::PrintNextChar("°") ; degree symbol
!+9::PrintNextChar("·") ; interpunct
!+-::PrintNextChar("—") ; em-dash
!+=::PrintNextChar("±") ; plus-or-minus sign
!+[::PrintNextChar("”") ; closing primary quotation marks (US English)
                        ; closing secondary quotation marks (UK English)
                        ; opening primary quotation marks (Hebrew)
!+]::PrintNextChar("’") ; closing secondary quotation mark (US English)
                        ; closing primary quotation mark (UK English)
                        ; opening secondary quotation mark (Hebrew)
                        ; apostrophe (English)
!+\::PrintNextChar("» ª") ; #1: right guillemets (angle quotes) (French)
                          ; #2: ordinal indicator (feminine)
!+'::PrintNextChar("Æ")
!+,::PrintNextChar("¯") ; macron ("long vowel")
!+.::PrintNextChar("˜") ; tilde
!+;::PrintNextChar("Ú") ; ellipses
; ` is redundant
!+/::PrintNextChar("¿") ; inverted question mark


; Non-standard extras ---------------------------------------------------------

; Ctrl + Alt + {minus}
!^-::PrintNextChar("−") ; minus sign

; Note: The following may conflict with workspace switching on some systems,
;       and so have been commented out.

; Ctrl + Alt + {number}
; !^0::PrintNextChar("⁰") ; superscript zero
; !^1::PrintNextChar("¹") ; superscript one
; !^2::PrintNextChar("²") ; superscript two
; !^3::PrintNextChar("³") ; superscript three
; !^4::PrintNextChar("⁴") ; superscript four
; !^5::PrintNextChar("⁵") ; superscript five
; !^6::PrintNextChar("⁶") ; superscript six
; !^7::PrintNextChar("⁷") ; superscript seven
; !^8::PrintNextChar("⁸") ; superscript eight
; !^9::PrintNextChar("⁹") ; superscript nine

; Ctrl + Alt + Shift + {number}
; !^+0::PrintNextChar("₀") ; subscript zero
; !^+1::PrintNextChar("₁") ; subscript one
; !^+2::PrintNextChar("₂") ; subscript two
; !^+3::PrintNextChar("₃") ; subscript three
; !^+4::PrintNextChar("₄") ; subscript four
; !^+5::PrintNextChar("₅") ; subscript five
; !^+6::PrintNextChar("₆") ; subscript six
; !^+7::PrintNextChar("₇") ; subscript seven
; !^+8::PrintNextChar("₈") ; subscript eight
; !^+9::PrintNextChar("₉") ; subscript nine

; Note: The following may conflict with things like Ubuntu workspaces or
;       Dexpot on Windows, and so have been commented out.

; Ctrl + Alt + {arrow}
; !^Left::PrintNextChar("←") ; left arrow
; !^Up::PrintNextChar("↑") ; up arrow
; !^Right::PrintNextChar("→") ; right arrow
; !^Down::PrintNextChar("↓") ; down arrow

; Ctrl + Alt + Shift + {arrow}
; !^+Left::PrintNextChar("⇐") ; wide left arrow
; !^+Up::PrintNextChar("⇑") ; wide up arrow
; !^+Right::PrintNextChar("⇒") ; wide right arrow
; !^+Down::PrintNextChar("⇓") ; wide down arrow
