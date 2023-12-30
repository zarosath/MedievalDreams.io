
SuperStrict
Framework brl.basic
Import brl.glmax2d
Import brl.map
Include "simpleUI.bmx"


AppTitle = "Simple UI demo"

Graphics 500, 500

Global but1:GUI_Button = New GUI_Button
	but1.Create(10, 10, 150, "Add dropdown item")
	
	
Global dd1:GUI_DropDown = New GUI_DropDown	
	dd1.Create(10, 40, 150)
	dd1.AddItem("Item 1")
	dd1.AddItem("Item 2")
	dd1.AddItem("Item 3")
	
	
Global lbl:GUI_Label = New GUI_Label
	lbl.Create(180, 10, 180, "This is a label")
	

Global txt:GUI_TextBox = New GUI_textbox
	txt.Create(10, 400, 450, "Textbox")
	txt.setText("sample text...")
	
	
Global chk:GUI_CheckBox = New GUI_Checkbox
	chk.Create(10, 440, "Rotate Back Color", 200)
	
	
Global lstbox:GUI_ListBox = New GUI_ListBox
	lstbox.Create(250, 40, 200, 300)
	lstbox.AddItem("List Item 1")
	lstbox.AddItem("List Item 2")
	lstbox.AddItem("List Item 3")

Global but2:GUI_Button = New GUI_Button
	but2.Create(250, 350, 200, "Add Listbox Item")
	
Global spnr:GUI_Spinner = New GUI_Spinner
	spnr.Create(10, 350, 160,,, 5, "spinner")
	
Global sldr:GUI_Slider = New GUI_slider
	sldr.Create(180, 80, 200, 100, True)
	sldr.SetValue(50)
'----------------------------------------------------------------------------------------------	
While Not KeyHit(KEY_ESCAPE)
	Cls
		If but1.Update() Then
			dd1.AddItem("new Item " + Rand(1, 100))
		End If
		
		dd1.Update()
		txt.Update()
		chk.Update()
		lstbox.Update()
		If but2.Update() Then
			lstbox.AddItem("new Item " + Rand(1, 100))
		End If
		spnr.Update()
		sldr.Update()
		
		
		
		but1.Render()
		dd1.Render()
		lbl.Render()
		txt.Render()
		chk.Render()
		lstbox.Render()
		but2.Render()
		spnr.Render()
		sldr.Render()
                DrawText(Fps(), 460, 1)
	Flip
	
	If chk.GetState()
		SetClsColor(Abs(Sin(MilliSecs() / 10)) * 200, Abs(Sin(MilliSecs() / 20)) * 200, Abs(Sin(MilliSecs() / 30)) * 200)
	Else
		SetClsColor(0, 0, 0)
	EndIf
Wend
'----------------------------------------------------------------------------------------------


Function Fps%()
	Global fps%
	Global fpst:Long
	Global fpsc%
	Local Milli:Long=Long(MilliSecs())+4294967296:Long
	If fpst < Milli Then
		fpst=Milli+1000
		fps = fpsc
		fpsc = 0
	Else
		fpsc = fpsc + 1
	End If
	Return fps
End Function
