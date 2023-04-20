#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!c::
{ 
    ; This is required to get the full path of the file from the address bar
    WinGetText, full_path, A

    ; Split on newline (`n)
    StringSplit, word_array, full_path, `n

    ; Find and take the element from the array that contains address
    Loop, %word_array0%
    {
        IfInString, word_array%A_Index%, Address
        {
            full_path := word_array%A_Index%
            break
        }
    }  

    ; strip to bare address
    full_path := RegExReplace(full_path, "^Address: ", "")

    ; Just in case - remove all carriage returns (`r)
    StringReplace, full_path, full_path, `r, , all


    IfInString full_path, \
    {
        Run,  C:\Program Files\Microsoft VS Code\Code.exe %full_path%
    }
    else
    {
        Run, C:\Program Files\Microsoft VS Code\Code.exe 
    }
    return
  
} 

^!t::
{
    ; This is required to get the full path of the file from the address bar
    WinGetText, full_path, A

    ; Split on newline (`n)
    StringSplit, word_array, full_path, `n

    ; Find and take the element from the array that contains address
    Loop, %word_array0%
    {
        IfInString, word_array%A_Index%, Address
        {
            full_path := word_array%A_Index%
            break
        }
    }  

    ; strip to bare address
    full_path := RegExReplace(full_path, "^Address: ", "")

    ; Just in case - remove all carriage returns (`r)
    StringReplace, full_path, full_path, `r, , all


    IfInString full_path, \
    {
        Run,  C:\Program Files\Git\git-bash.exe, %full_path%
    }
    else
    {
        Run, C:\Program Files\Git\git-bash.exe --cd-to-home
    }
    return
}

#IfWinActive
^!q::
WinClose , A
return

;VS code Vim
if WinActive("ahk_class" Chrome_WidgetWin_1)
{
CapsLock & j::
Send 5j
return



CapsLock & k::
Send 5k
return

CapsLock & h::
Send 5h
return

CapsLock & l::
Send 5l
return

Capslock::
send {Esc}
return

}


;music controle
RAlt & Right::
Send {Media_Next}
return

RAlt & Left::
Send {Media_Prev}
return

RAlt & Up::
Send {Media_Play_Pause}
return

