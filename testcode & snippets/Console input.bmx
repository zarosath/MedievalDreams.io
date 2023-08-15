Local command:String = Input("Command>: ")
command.toLower()
Select command
Case "close" shutdown=True
Case "stop" shutdown=True
Case "shutdown" shutdown=True
Case "exit" shutdown=True
Case "help" Print " close the server: Commands exit, close, stop, shutdown"
Default
Print "Commands: close, stop, shutdown, exit, help"
EndSelect
Print "test"
