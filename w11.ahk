#Persistent
#MaxThreadsPerHotkey 2  ; Allow hotkey to be interrupted

toggle := false  ; Variable to track toggle state
cooldown_interval := 10 ; The smallest practical cooldown in milliseconds
cooldown_timer := 0

F4::
    toggle := !toggle
    if (toggle) {
        SetTimer, DragAndGrow, %cooldown_interval%
    } else {
        SetTimer, DragAndGrow, Off
    }
return

DragAndGrow:
    if (!toggle)
        return

    if (A_TickCount - cooldown_timer >= cooldown_interval) {
        cooldown_timer := A_TickCount
        WinGet, active_id, ID, A
        WinGetPos, , , current_width, current_height, ahk_id %active_id%

        new_width := current_width + 5
        new_height := current_height + 5

        WinMove, ahk_id %active_id%, , , , %new_width%, %new_height%

        ; Send backslash and Enter
        Send, {\}
        ; Sleep, 1 ; Very short delay, might be unnecessary with such a fast resize
        Send, {Enter}
    }
return

