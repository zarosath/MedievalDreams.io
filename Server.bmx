Strict
Import BRL.StandardIO
' This is the main server API for the game client

Local hints:TAddrInfo = New TAddrInfo(AF_UNSPEC_, SOCK_STREAM_) ' socket object
Local socket:TSocket = TSocket.Create(hints) ' actual socket
If Not socket Then
    Print "Unable to create socket."
    End
End If

Print "Socket Created"

Local Command:String = Input("Server> "+ "Emter Command (--help for list of commands ")
Print "Hello "+command