#Requires AutoHotkey v2.0

CapsLock::Lwin

#b::
{
    if WinActive("ahk_exe msedge.exe")
        WinMinimize
    else if WinExist("ahk_exe msedge.exe")
        WinActivate
    else
        Run "msedge.exe"
}

#e::
{
    if WinActive("ahk_exe olk.exe")
        WinMinimize
    else if WinExist("ahk_exe olk.exe")
        WinActivate
    else
        Run "olk.exe"
}

#f::
{
    if WinActive("ahk_class CabinetWClass")
        WinMinimize
    else if WinExist("ahk_class CabinetWClass")
        WinActivate
    else
        Run "explorer.exe"
}

#q:: Send "!{F4}"

#t::
{
    if WinActive("ahk_exe WindowsTerminal.exe")
        WinMinimize
    else if WinExist("ahk_exe WindowsTerminal.exe")
        WinActivate
    else
        Run "wt.exe"
}

#x::
{
    if WinActive("ahk_exe Everything.exe")
        WinMinimize
    else if WinExist("ahk_exe Everything.exe")
        WinActivate
    else
        Run "C:\\Program Files\\Everything\\Everything.exe"
}
