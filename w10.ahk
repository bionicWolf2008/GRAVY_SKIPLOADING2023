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
