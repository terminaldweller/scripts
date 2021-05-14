#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^Capslock::Capslock

#InstallKeybdHook
SetCapsLockState, alwaysoff
Capslock::
Send {LControl Down}
KeyWait, CapsLock
Send {LControl Up}
if ( A_PriorKey = "CapsLock" ) {
  Send {Esc} 
}
return

~*^a::
~*^b::
~*^c::
~*^d::
~*^e::
~*^f::
~*^g::
~*^h::
~*^i::
~*^j::
~*^k::
~*^l::
~*^m::
~*^n::
~*^o::
~*^p::
~*^q::
~*^r::
~*^s::
~*^t::
~*^u::
~*^v::
~*^w::
~*^x::
~*^y::
~*^z::
~*^1::
~*^2::
~*^3::
~*^4::
~*^5::
~*^6::
~*^7::
~*^8::
~*^9::
~*^0::
~*^Space::
~*^Backspace::
~*^Delete::
~*^Insert::
~*^Home::
~*^End::
~*^PgUp::
~*^PgDn::
~*^Tab::
~*^Return::
~*^,::
~*^.::
~*^/::
~*^;::
~*^'::
~*^[::
~*^]::
~*^\::
~*^-::
~*^=::
~*^`::
~*^F1::
~*^F2::
~*^F3::
~*^F4::
~*^F5::
~*^F6::
~*^F7::
~*^F8::
~*^F9::
~*^F10::
~*^F11::
~*^F12::
    g_AbortSendEsc := true
    return

LShift::
RShift::
Shift::Send % (A_ThisHotkey = "LShift" ? "{{}" : "{}}")

LControl::
RControl::
Control::Send % (A_ThisHotkey = "LControl" ? "[" : "]")

LAlt::
RAlt::
Alt::Send % (A_ThisHotkey = "LAlt" ? "(" : ")")

; The next part is only relevant to users of Virtual Box, which interacts weirdly with AutoHotkey. The code below resets ctrl  and caps lock when a Virtual Box window is unfocused.
InVB()
{
	return WinActive("ahk_exe VirtualBox.exe")
}
in_vb:=InVB()
was_in_vb:=in_vb

Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,Hwnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )

ShellMessage( wParam,lParam )
{
 global in_vb
 global was_in_vb
 was_in_vb:=in_vb
 in_vb:=InVB()
 if (was_in_vb and not in_vb)
 {
	Suspend On
	Send {LControl Up}
	SetCapsLockState Off
	Suspend Off
 }
}
