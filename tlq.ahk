#Persistent
#MaxThreadsPerHotkey 2  ; Allow hotkey to be interrupted

toggle := false  ; Variable to track toggle state

F4::
    toggle := !toggle
    if (toggle) {
        SetTimer, SpamKeys, 10
    } else {
        SetTimer, SpamKeys, Off
    }
return

SpamKeys:
    Send, \{Enter}
return

F3::
    f3toggle := !f3toggle
    if (f3toggle) {
        SetTimer, RunF3Actions, 10
    } else {
        SetTimer, RunF3Actions, Off
    }
return

F2::  ; Stop the F3 toggle
    f3toggle := false
    SetTimer, RunF3Actions, Off
    SendInput, {F1}
return

RunF3Actions:
    SetTimer, RunF3Actions, Off  ; Prevent reentry

    MouseMove, 33, 509, 2.5
    Click
    MouseMove, 1279, 340, 2.5
    Click
    MouseMove, 1276, 371, 2.5
    Click
    MouseMove, 837, 437, 2.5

    Send, tele  ; Type "chan"

    while (f3toggle) {
        Send, p  ; Loop for 6 seconds
        Sleep, 50
        Send, o
        Sleep, 50
        Send, {Backspace}
        Sleep, 50
        Send, {Backspace}
        Sleep, 50
    }

    return
