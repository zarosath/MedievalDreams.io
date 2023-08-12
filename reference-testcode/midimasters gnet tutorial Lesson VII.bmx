SuperStrict
Graphics 400,300
Global Host:TGNetHost=CreateGNetHost()
Local Name:String

Const GNET_SERVER_SLOT:Int =31
Const GNET_NAME:Int = 1
Const GNET_X:Int    = 2
Const GNET_Y:Int    = 3
Const GNET_ID:Int   = 4

Global I_Am_Server:Int=False
Global IsAliveText:String, TimeRemain:String

If GNetListen(Host,12345) = True
    Name="SERVER"
    I_Am_Server = True
Else
    If GNetConnect(Host,"127.0.0.1",12345)=False
        Name ="Error"
    Else
        Name="Client"
    EndIf
EndIf

Global Me:TPlayer = TPlayer.AddMe(Name)

Global    TimeOut:Int = MilliSecs()+5000
Repeat
    Cls
    SetColor 255,255,255
    DrawText IsAliveText + TimeRemain  ,  30,160
    ScanGNet
    MoveMe
    TPlayer.DrawAll
    ChangeColor Me.Id()
    DrawText "HERE= " + Name, 150, 10
    Flip 1
Until AppTerminate() Or TimeOut<MilliSecs()

CloseGNetObject(Me.GObj)
Delay 500
CloseGNetHost(Host)
End


Function ScanGnet()
    ' find new
    GNetSync(Host)
    For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CREATED )
        TPlayer.AddOthers obj
    Next
    For Local obj:TGNetObject=EachIn GNetObjects( host, GNET_CLOSED )
        TPlayer.Remove obj
    Next
    DrawText "GNetObjects:" + GNetObjects(Host,GNET_ALL ).Count() , 30,100
    DrawText "TPlayers:" + TPlayer.All.Count() , 30,130
    IsAliveText = "Server is dead"
    TimeRemain  = "  (timeout in:" + Int((timeOut-MilliSecs())/1000) + "sec)"
    For Local loc:TGnetObject=EachIn GNetObjects(Host,GNET_ALL )
       
        If GetGNetInt(loc, GNET_SERVER_SLOT)=True
            IsAliveText="Server is Alive"
            TimeOut=MilliSecs()+5000
            Return
        EndIf
    Next
End Function


Function MoveMe()
    If MouseDown(1)
            Me.Move MouseX(), MouseY()
    EndIf
End Function



Type TPlayer
    Global All:TList = New TList
    Field GObj:TGNetObject

    Method Move(X:Int, Y:Int)
        SetGNetInt GObj, GNET_X , X
        SetGNetInt GObj, GNET_Y , Y  
    End Method

    Function DrawAll()
        For Local loc:TPlayer = EachIn All
            loc.Draw
        Next
    End Function
  
    Method Draw()
        ChangeColor ID()
        DrawText "Player:" + Name() , X() , Y()      
    End Method
  
    Method Name:String()
        Return GetGNetString(GObj,GNET_NAME)
    End Method
  
    Method X:Int()
        Return GetGNetInt(GObj,GNET_X)
    End Method

    Method Y:Int()
        Return GetGNetInt(GObj,GNET_Y)
    End Method

    Method ID:Int()
        Return GetGNetInt(GObj,GNET_ID)
    End Method
 

    Method Define(Nr:Int, Nam:String)
        Nam = Nam +" (ID=" +Nr + ")"
        SetGNetInt    GObj, GNET_ID         , Nr
        SetGNetString GObj, GNET_NAME       , Nam
    End Method

   
    Function AddMe:TPlayer(Name:String)
        Local loc:TPlayer = New TPlayer

        ' first fast setup
        loc.GObj = CreateGNetObject(Host)
        SetGNetInt(loc.GObj, GNET_SERVER_SLOT, I_Am_Server )
        loc.Define 0,""
        loc.move Rand(300),Rand(250)
        All.AddLast loc
       
        ' second exact setup
        ScanGnet()
        Delay 500
        ScanGnet()
        loc.Define GNetObjects(Host,GNET_ALL ).Count() , Name
        Return loc
    End Function
 
 
    Function AddOthers(Obj:TGNetObject)
        Local loc:TPlayer = New TPlayer
        loc.GObj = Obj
        All.AddLast loc
    End Function


    Function Remove(obj:TGNetObject)
        For Local loc:TPlayer = EachIn All
            If loc.GObj=obj
                All.Remove loc
            EndIf
        Next
    End Function
End Type


Function ChangeColor(ID:Int)
    Select ID
        Case 0
            SetColor 77,77,77
        Case 1
            SetColor 255,255,0
        Case 2
            SetColor 0,255,255       
        Case 3
            SetColor 255,0,255
    End Select
End Function 
