SuperStrict
' This is the main server API for the game client
Framework brl.GNet
Import brl.standardio
Import brl.threads
?win32
Import Pub.Win32
?
' Color codes for console
Global RED:String = "~$1b~[0;31m"
Global GRN:String = "~$1b~[0;32m"
Global BLU:String = "~$1b~[0;34m"
Global YEL:String = "~$1b~[0;33m"
Global WHT:String = "~$1b~[0;37m"

'Windows? Console mode for windows
?win32
	Local hConsoleHandle:Byte Ptr = GetStdHandle(STD_OUTPUT_HANDLE)
	Local dwMode:ULongInt
	GetConsoleMode(hConsoleHandle, dwMode)
	dwMode :| $0004
	SetConsoleMode(hConsoleHandle, dwMode)
?

'externalize pub.win32 functions for text/console mode color
?win32
Extern "Win32"
	Function GetConsoleMode:Int(hConsoleHandle:Byte Ptr, lpMode:ULongInt Var) = "WINBOOL __stdcall GetConsoleMode(HANDLE, LPDWORD)!"
	Function SetConsoleMode:Int(hConsoleHandle:Byte Ptr, dwMode:ULongInt) = "WINBOOL __stdcall SetConsoleMode(HANDLE, DWORD)!"
End Extern
?


' Server Port for clients to connect to
Local port:Int = 12345

Global Host:TGNetHost=CreateGNetHost()
If Host
   PrintColor("Host created.", BLU)
Else
   Print "Couldnt create host."
   End
EndIf

Global listen:Int = GNetListen(Host,port)
If listen
   PrintColor("Server listening on Port "+ port, BLU)
Else
   Print "Could not bind socket."
   CloseGNetHost Host
   End
EndIf
Global shutdown:Int = False
Local ServerMilliseconds:Int=MilliSecs()
Local inputthread:TThread=CreateThread(commandinput, "")
Repeat
    GNetSync Host
    'Print MilliSecs()
Until shutdown=True

Function commandinput:Object(data:Object)
Repeat
Local command:String = Input(GRN+"Command>: " + "~$1b~[0m")
command.toLower()
Select command
Case "close" shutdown=True
Case "stop" shutdown=True
Case "shutdown" shutdown=True
Case "exit" shutdown=True
Case "help" 
Printcolor("Commands are Case sensitive", WHT)
Printcolor("Commands to terminate server: exit, close, stop, shutdown", WHT)
Default
PrintColor("Commands: close, stop, shutdown, exit, help", RED)
Printcolor("Commands are Case sensitive", WHT)
EndSelect
Until shutdown=True

EndFunction

Function PrintColor(Text:String, colorCode:String)
	Text = colorCode + Text + "~$1b~[0m"
	Print(Text)
End Function

DetachThread(inputthread)
CloseGNetHost(host)