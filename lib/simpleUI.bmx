

'------------------------------------------
''SimpleGUI'	Original code by Supertino
'------------------------------------------

Type GUI_Properties
	
	Const UP:Int = 0, Right:Int = 1, DOWN:Int = 2, Left:Int = 3
	Global Color:GUI_Colors = New GUI_Colors
	Global Shape:GUI_Shapes = New GUI_Shapes
	Global GadgetID:Int						' keep track of the number of gadgets to assign new id's
	Global SelectedGadgetID:Int				' what gadget is currently selected
	Const DEFAULTGADSIZE:Int = 22			' gadget height of gadgets that do not have a height attribute
	Field _textWidth:Int = TextWidth("X")			' width of a char
	Field _x:Int							' x position of the gadget
	Field _y:Int							' y position of the gadget
	Field _width:Int						' width of gadget
	Field _height:Int						' height of gadget
	Field _id:Int							' unique id of the gadget
	Field _label:String 					' for gadgets that have a label such as button and textbox
	Field _value:Int 						' for gadgets that return an Int value
	Field _text:String 						' for gadgets that return a String value
	Field _index:Int 						' for gadgets that return a index value
	Field _state:Int						' for gagets that can have states, buttons, checkboxes
	Field _enabled% = True				' enable\disable gadget flag
	Field _hidden%						' hide\show gadget flag
	
	Field TH%
	'Summary:
	Method SetGadgetID:Int(); GadgetID = GadgetID + 1; Return GadgetID; End Method
	
	'Summary:
	Method MouseOverGadget%()
		If MouseX() > _x And MouseY() > _y And MouseX() < _x + _width And MouseY() < _y + _height Then Return True
	End Method
	
	'Summary:
	Function StrMid:String(value:String, index:Int, count:Int)
		Return value[ (index - 1) .. ( (index - 1) + count)]
	End Function
	
	
	Method X:Int(); Return _x; End Method
	Method Y:Int(); Return _y; End Method
	Method width:Int(); Return _width; End Method
	Method height:Int(); Return _height; End Method
	
	Method Disable (); _enabled = False; End Method
	Method Enable (); _enabled = True; End Method
	
	Method Show (); _hidden = False; End Method
	Method Hide (); _hidden = True; End Method
	
	Method New()
		TH = TextHeight("X")
	End Method
	
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_Colors
	
	Method Reset (); SetColor 255, 255, 255; End Method
	Method Base (); SetColor 68, 134, 250; End Method
	Method Dark (); SetColor 39, 59, 155; End Method
	Method Lite (); SetColor 100, 200, 255; End Method
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_Shapes
	
	Const THICKNESS:Int = 1
	Const Left:Int = 0, CENTER:Int = 1, Right:Int = 2
	Const TOP:Int = 0, MIDDLE:Int = 1, BOTTOM:Int = 2
	
	'Summary: Draw a button gadget
	Method Button (a:GUI_Button)
		Select a._state
			Case 0
				a.Color.Lite; DrawRect a._x, a._y, a._width, a._height
				a.Color.Dark; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
				a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
				a.Color.Reset
				If a._arrow
					DrawButtonArrow(a._arrowType, a._x, a._y, a._width, a._height)
				Else
					DrawLabel(a._label, a._x, a._y, a._width, a._height, MIDDLE, CENTER)
				End If
			Case 1
				a.Color.Dark; DrawRect a._x, a._y, a._width, a._height
				a.Color.Lite; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
				a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
				a.Color.Reset
				If a._arrow
					DrawButtonArrow(a._arrowType, a._x + 1, a._y + 1, a._width, a._height)
				Else
					DrawLabel(a._label, a._x + 1, a._y + 1, a._width, a._height, MIDDLE, CENTER)
				End If
		End Select
	End Method
	
	'Summary: Draw the arrows on sliders and spinner
	Method DrawButtonArrow (dir:Int, x:Int, y:Int, width:Float, height:Float)
		Local point:Float[6]
		Select dir
			Case 0
				point[0] = x + (width / 2)
				point[1] = y + (height / 2) - (height / 4)
				point[2] = x + (width / 2) + (width / 4)
				point[3] = y + (height / 2) + (height / 4)
				point[4] = x + (width / 2) - (width / 4)
				point[5] = point[3]
			Case 1
				point[0] = x + (width / 2) - (width / 4)
				point[1] = y + (height / 2) - (height / 4)
				point[2] = x + (width / 2) + (width / 4)
				point[3] = y + (height / 2)
				point[4] = point[0]
				point[5] = y + (height / 2) + (height / 4)
			Case 2
				point[0] = x + (width / 2) - (width / 4)
				point[1] = y + (height / 2) - (height / 4)
				point[2] = point[0] + (width / 2)
				point[3] = point[1]
				point[4] = point[0] + (width / 4)
				point[5] = point[1] + (height / 2)
			Case 3
				point[0] = x + (width / 2) + (width / 4)
				point[1] = y + (height / 2) - (height / 4)
				point[2] = point[0]
				point[3] = y + (height / 2) + (height / 4)
				point[4] = x + (width / 2) - (width / 4)
				point[5] = y + (height / 2)
		End Select
		DrawPoly(point)
	End Method
	
	'Summary: Draw a text box gadget
	Method TextBox (a:GUI_TextBox)
		a.Color.Dark; DrawRect a._x, a._y, a._width, a._height
		a.Color.Lite; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
		a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
		a.Color.Reset; DrawLabel(a._label, a._x - TextWidth(a._label) + 1, a._y + 1, a._width, a._height, MIDDLE, Left)
		DrawLabel(a._visableText, a._x + 4, a._y, a._width, a._height, MIDDLE, Left)
	End Method
	
	'Summary: Draw a spinner gadget
	Method Spinner (a:GUI_Spinner)
		a.Color.Dark; DrawRect a._x, a._y, a._width, a._height
		a.Color.Dark; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
		a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
		a.Color.Reset; DrawLabel(a._label, (a._x - TextWidth(a._label)) + 1, a._y + 1, a._width, a._height, MIDDLE, Left)
		DrawLabel(a._value, a._x, a._y, a._width, a._height, MIDDLE, CENTER)
	End Method
	
	'Summary: Draw a gadget label (attached to a gadget)
	Method DrawLabel (Text:String, x:Int, y:Int, width:Int, height:Int, align_vert:Int = Left, align_horz:Int = TOP)
		If Text.Length = 0 Then Return
		Local tw:Float = TextWidth(Text) ' need to caste out else Desktop build crashes
		Local th:Float = TextHeight(Text) ' need to caste out else Desktop build crashes		'AW

		Select align_horz
			Case CENTER; x = Float(x) + (Float(width) / 2.0) - (tw / 2.0)
			Case Right; x = Float(x) + Float(width) - tw
			Default;
		End Select

		Select align_vert
			Case MIDDLE; y = Float(y) + (Float(height) / 2) - (th / 2)
			Case BOTTOM; y = Float(y) + Float(height) - th
			Default;
		End Select

		SetBlend LIGHTBLEND'AdditiveBlend
		DrawText Text, x, y
		SetBlend AlphaBlend
	End Method
	
	'Summary: Draw a slider gadget
	Method Slider (a:GUI_Slider)
		a.Color.Lite; DrawRect a._x, a._y, a._width, a._height
		a.Color.Dark; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
		a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
		a.Color.Reset		
		If a._vertBar
			If a._value = a._maxValue
				DrawRect a._x + (THICKNESS * 4), a._y + a._height - a._knobSize + (THICKNESS * 4), a._knobSize - (THICKNESS * 8), a._knobSize - (THICKNESS * 8)
			Else
				DrawRect a._x + (THICKNESS * 4), a._y + (a._increment * a._value) + (THICKNESS * 4), a._knobSize - (THICKNESS * 8), a._knobSize - (THICKNESS * 8)
			EndIf
		Else
			If a._value = a._maxValue
				DrawRect a._x + a._width - a._knobSize + (THICKNESS * 4), a._y + (THICKNESS * 4), a._knobSize - (THICKNESS * 8), a._knobSize - (THICKNESS * 8)
			Else
				DrawRect a._x + (a._increment * a._value) + (THICKNESS * 4), a._y + (THICKNESS * 4), a._knobSize - (THICKNESS * 8), a._knobSize - (THICKNESS * 8)
			EndIf
		EndIf
	End Method
	
	'Summary: Draw a slider gadget
	Method DropDown (a:GUI_DropDown, part:Int = 0)
		Select part
			Case 0 ' Main gadget
				If Not a._pressed
					a.Color.Lite; DrawRect a._x, a._y, a._width, a._height
					a.Color.Dark; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
					a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
					a.Color.Reset
					DrawButtonArrow(a.DOWN, a._x + a._width - a.DEFAULTGADSIZE, a._y, a.DEFAULTGADSIZE, a.DEFAULTGADSIZE)
					If MapCount(a._itemList) = 0 Return
					DrawLabel(a.StrMid(String(a._itemList.ValueForKey(a._index + 1)), 1, ((a._width - a.DEFAULTGADSIZE) / a._textWidth) - 1), a._x + 4, a._y, a._width, a._height, MIDDLE, Left)
				Else
					a.Color.Dark; DrawRect a._x, a._y, a._width, a._height
					a.Color.Lite; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
					a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
					a.Color.Reset
					DrawButtonArrow(a.DOWN, a._x + a._width - a.DEFAULTGADSIZE + 1, a._y + 1, a.DEFAULTGADSIZE, a.DEFAULTGADSIZE)
					If MapCount(a._itemList) = 0 Return
					DrawLabel(a.StrMid(String(a._itemList.ValueForKey(a._index + 1)), 1, ((a._width - a.DEFAULTGADSIZE) / a._textWidth) - 1), a._x + 4 + 1, a._y + 1, a._width, a._height, MIDDLE, Left)
				EndIf
			Case 1 ' drop down list
				If MapCount(a._itemList) = 0 Then Return
				Local height:Int = MapCount(a._itemList) * a._listLineHeight
				Local y% = a._y + a._height
				If a._showListAbove
					y = a._y - height
				End If
				a.Color.Lite; DrawRect a._x, y, a._width, height
				a.Color.Dark; DrawRect a._x + THICKNESS, y + THICKNESS, a._width - THICKNESS, height - THICKNESS
				a.Color.Base; DrawRect a._x + THICKNESS, y + THICKNESS, a._width - (THICKNESS * 2), height - (THICKNESS * 2)
				a.Color.Dark
				If a._showListAbove
					DrawRect a._x + THICKNESS, a._y - (MapCount(a._itemList) * a._listLineHeight) + THICKNESS + (a._index * a._listLineHeight), a._width - (THICKNESS * 2), a._listLineHeight - (THICKNESS * 2)
				Else
					DrawRect a._x + THICKNESS, (a._y + a._height) + (a._index * a._listLineHeight) + THICKNESS, a._width - (THICKNESS * 2), a._listLineHeight - (THICKNESS * 2)
				EndIf
				a.Color.Reset
				For Local b:Int = 1 To MapCount(a._itemList)
					DrawLabel(a.StrMid(String(a._itemList.ValueForKey(b)), 1, (a._width / a._textWidth) - 1), a._x + 4, (y) + (b - 1) * a._listLineHeight, a._width, a._listLineHeight, MIDDLE, 0)
				Next
		End Select
	End Method
	
	'Summary: Draw a text box gadget
	Method CheckBox (a:GUI_CheckBox)
		a.Color.Dark; DrawRect a._x, a._y, a._width, a._height
		a.Color.Lite; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
		a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
		a.Color.Reset; DrawLabel(a._label, a._x + a._textWidth + a._width, a._y, a._width, a._height, MIDDLE, Left)
		If a._state
			DrawLine a._x + (a._width / 3), a._y + (a._height / 2), (a._x + a._width) - (a._width / 2), (a._y + a._height) - (a._height / 4)
			DrawLine a._x + (a._width / 3) - 1, a._y + (a._height / 2), (a._x + a._width) - (a._width / 2) - 1, (a._y + a._height) - (a._height / 4)
			DrawLine(a._x + a._width) - (a._width / 4), a._y + (a._height / 4), a._x + (a._width / 2), (a._y + a._height) - (a._height / 4)
			DrawLine(a._x + a._width) - (a._width / 4) - 1, a._y + (a._height / 4), a._x + (a._width / 2) - 1, (a._y + a._height) - (a._height / 4)
		EndIf
	End Method
	
	'Summary: Draw a text box gadget
	Method ListBox (a:GUI_ListBox)
		a.Color.Dark; DrawRect a._x, a._y, a._width, a._height
		a.Color.Lite; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - THICKNESS, a._height - THICKNESS
		a.Color.Base; DrawRect a._x + THICKNESS, a._y + THICKNESS, a._width - (THICKNESS * 2), a._height - (THICKNESS * 2)
		a.Color.Reset; DrawLabel(a._label, a._x + a._textWidth + a._width, a._y, a._width, a._height, MIDDLE, Left)
		a.Color.Dark
		If a._selectedIndex >= a._listOffset And a._selectedIndex < (a._visableItemCount + a._listOffset)
			DrawRect a._x + THICKNESS,(a._y) + (a._selectedIndex * a._listLineHeight) + THICKNESS - (a._listOffset * a._listLineHeight),a._width - (THICKNESS * 2), a._listLineHeight - (THICKNESS * 2)
		EndIf
		a.Color.Reset
		For Local b:Int = 1 + a._listOffset To a._visableItemCount + a._listOffset
			DrawLabel(a.StrMid(String(a._itemList.ValueForKey(b)), 1, (a._width / a._textWidth) - 1), a._x + 4, ((a._y) + (b - 1) * a._listLineHeight) - (a._listOffset * a._listLineHeight), a._width, a._listLineHeight, MIDDLE, 0)
		Next
	End Method
	
End Type

'="=================================================================================================—
'=š=================================================================================================
'="=================================================================================================—
'=š=================================================================================================
'="=================================================================================================—
'=š=================================================================================================

Type GUI_Button Extends GUI_Properties

	Field _arrow%
	Field _arrowType:Int
'Public
	'Summary:
	Method Create (x:Int, y:Int, width:Int, Text:String = "", height:Int = DEFAULTGADSIZE)
		_x = x
		_y = y
		_width = width
		_height = height
		_id = SetGadgetID()
		If Text = "" Then _label = "button " + _id Else _label = Text
		If Text = "@!U" Then _arrow = True; _arrowType = UP
		If Text = "@!R" Then _arrow = True; _arrowType = Right
		If Text = "@!D" Then _arrow = True; _arrowType = DOWN
		If Text = "@!L" Then _arrow = True; _arrowType = Left
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.Button(Self)
	End Method
	
	'Summary:
	Method Update%()
		If _enabled = False Or _hidden = True Then Return False
		If SelectedGadgetID = 0
			If MouseOverGadget() And MouseHit(MOUSE_LEFT) Then SelectedGadgetID = _id
		ElseIf SelectedGadgetID = _id
			If MouseDown(MOUSE_LEFT) And MouseOverGadget()
				_state = 1
			ElseIf MouseDown(MOUSE_LEFT) And Not MouseOverGadget()
				_state = 0
			ElseIf Not MouseDown(MOUSE_LEFT) And MouseOverGadget()
				_state = 0
				SelectedGadgetID = 0
				Return True
			ElseIf Not MouseDown(MOUSE_LEFT) And Not MouseOverGadget()
				_state = 0
				SelectedGadgetID = 0
				Return False
			EndIf
		EndIf
	End Method
	
End Type


Type GUI_TextBox Extends GUI_Properties
	
	Field _visableText:String
	Field _cursorBlink:Int
	Field _cursorTimer:Int
	Field _cursorOffset:Int
	Field _textOffset:Int
	
	'Summary:
	Method EditText ()
		If _state = 0 Return
		Repeat
		
		
			If KeyHit(KEY_LEFT)'char = CHAR_LEFT
				_cursorOffset = _cursorOffset - 1
				If _cursorOffset <= 0
					_cursorOffset = 0
					_textOffset = _textOffset - 1
					If _textOffset <= 0 Then _textOffset = 0
				EndIf
			ElseIf KeyHit(KEY_RIGHT)'char = CHAR_RIGHT
				_cursorOffset = _cursorOffset + 1
				If _cursorOffset >= _visableText.Length
					_cursorOffset = _visableText.Length
					_textOffset = _textOffset + 1
					If _textOffset >= _text.Length - _visableText.Length Then _textOffset = _text.Length - _visableText.Length
				EndIf
			ElseIf KeyHit(KEY_DELETE)
				'If _textOffset = 0 And _cursorOffset = 0 Then Exit
				Local part:String[2]
				part[0] = StrMid(_text, 1, _textOffset + _cursorOffset - 0)
				part[1] = StrMid(_text, _textOffset + _cursorOffset + 1, _text.Length - (_textOffset + _cursorOffset))
				If part[1].Length > 0 Then part[1] = part[1][1..]
				_text = part[0] + part[1]
			EndIf
		
			Local char% = GetChar()
			If (Not char) Then Exit
			
			
			
			
			If char = 8'CHAR_BACKSPACE
				If _textOffset = 0 And _cursorOffset = 0 Then Exit
				Local part:String[2]
				part[0] = StrMid(_text, 1, _textOffset + _cursorOffset - 1)
				part[1] = StrMid(_text, _textOffset + _cursorOffset + 1, _text.Length - (_textOffset + _cursorOffset))
				_text = part[0] + part[1]
				_textOffset = _textOffset - 1
				If _textOffset < 0
					_textOffset = 0
					_cursorOffset = _cursorOffset - 1
				End If
					
			'ElseIf char = CHAR_ENTER or char = CHAR_ESCAPE
			ElseIf char = 13 'Or char = 27
				SelectedGadgetID = 0
				_state = 0
				_textOffset = 0
				Exit
			'ElseIf char = CHAR_UP
			'ElseIf char = CHAR_DOWN
'			ElseIf KeyHit(KEY_LEFT)'char = CHAR_LEFT
'				_cursorOffset = _cursorOffset - 1
'				If _cursorOffset <= 0
'					_cursorOffset = 0
'					_textOffset = _textOffset - 1
'					If _textOffset <= 0 Then _textOffset = 0
'				EndIf
'			ElseIf KeyHit(KEY_RIGHT)'char = CHAR_RIGHT
'				_cursorOffset = _cursorOffset + 1
'				If _cursorOffset >= _visableText.Length
'					_cursorOffset = _visableText.Length
'					_textOffset = _textOffset + 1
'					If _textOffset >= _text.Length - _visableText.Length Then _textOffset = _text.Length - _visableText.Length
'				EndIf
			ElseIf char >= 32
				Local part:String[2]
				part[0] = StrMid(_text, 1, _textOffset + _cursorOffset)
				part[1] = StrMid(_text, _textOffset + _cursorOffset + 1, _text.Length - (_textOffset + _cursorOffset))
				'_text = part[0] + String.FromChar(char) + part[1]
				_text = part[0] + Chr(char) + part[1]
				CalcVisableText()
				If _cursorOffset < _visableText.Length
					_cursorOffset = _cursorOffset + 1
				Else
					_textOffset = _textOffset + 1
				EndIf
			EndIf
		Forever
	End Method
	
	'Summary:
	Method DrawCursor ()
		If _state = 0 Return
		If _cursorTimer < MilliSecs()
			_cursorTimer = MilliSecs() + 200
			If _cursorBlink = 0 Then _cursorBlink = 1 Else _cursorBlink = 0
		End If
		If _cursorBlink = 0 Then Return
		Color.Reset() ; DrawRect(_x + (_textWidth * _cursorOffset) + 4, _y + (_height / 2) - (TH / 2) + 1, _textWidth / 3, TH)
	End Method
	
	'Summary:
	Method CalcVisableText ()
		_visableText = StrMid(_text, (_textOffset + 1), (_width / _textWidth) - 1)
	End Method
	
	'Public
	'Summary:
	Method Create (x:Int, y:Int, width:Int, label:String = "")
		If label.Length > 0 Then _label = label + " "
		_x = x + TextWidth(_label)
		_y = y
		_width = width - TextWidth(_label)
		_height = DEFAULTGADSIZE
		_id = SetGadgetID()
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.TextBox(Self)
		DrawCursor()
	End Method
	
	'Summary:
	Method Update%()
		CalcVisableText()
		If _enabled = False Or _hidden = True Then Return False
		If SelectedGadgetID = 0
			If MouseOverGadget() And MouseHit(1) Then SelectedGadgetID = _id
		ElseIf SelectedGadgetID = _id
			If _state = 0
				If _text.Length > _visableText.Length
					_cursorOffset = _visableText.Length
					_textOffset = _text.Length - _visableText.Length
				Else
					_cursorOffset = _text.Length
				EndIf
			EndIf
			_state = 1
			If MouseHit(1) Then SelectedGadgetID = 0; _state = 0; _textOffset = 0
		EndIf
		EditText()
	End Method
	
	'Summary:
	Method SetText (Text:String); _text = Text; End Method
	
	'Summary:
	Method GetText:String(); Return _text; End Method
	
	'Summary:
	Method X:Int(); Return _x - TextWidth(_label); End Method
	
	'Summary:
	Method width:Int(); Return _width + TextWidth(_label); End Method
	
End Type



Type GUI_Spinner Extends GUI_Properties
	
	
	Field _cmdAdd:GUI_Button = New GUI_Button
	Field _cmdSub:GUI_Button = New GUI_Button
	Field _increment:Int
	
	'Public
	
	'Summary:
	Method Create (x:Int, y:Int, max_width:Int, digit_count:Int = 3, value:Int = 0, increment:Int = 1, label:String = "")
		If label.Length > 0 Then _label = label + " "
		_y = y
		_width = ( (digit_count + 2) * _textWidth)
		If (_width + DEFAULTGADSIZE + TextWidth(_label)) > max_width Then
			_label = StrMid(_label, 1, ( (max_width - (_width + DEFAULTGADSIZE)) / _textWidth) - 1)
			_label = _label + " "
			_x = x + TextWidth(_label)
		Else
			_x = x + TextWidth(_label)
		EndIf
		_height = DEFAULTGADSIZE
		_id = SetGadgetID()
		_value = value
		_increment = increment
		_cmdAdd.Create(_x + _width, _y, DEFAULTGADSIZE, "@!U", (DEFAULTGADSIZE / 2))
		_cmdSub.Create(_x + _width, _y + (DEFAULTGADSIZE / 2), DEFAULTGADSIZE, "@!D", (DEFAULTGADSIZE / 2))
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.Spinner(Self)
		_cmdAdd.Render
		_cmdSub.Render
	End Method
	
	'Summary:
	Method Update ()
		If _enabled = False Or _hidden = True Then Return
		If _cmdAdd.Update() Then _value = _value + _increment
		If _cmdSub.Update() Then _value = _value - _increment
	End Method
	
	'Summary:
	Method SetValue (value:Int); _value = value; End Method
	
	'Summary:
	Method GetValue:Int(); Return _value; End Method
	
	'Summary:
	Method SetIncrement (value:Int); _increment = value; End Method
	
	'Summary:
	Method X:Int(); Return _x - TextWidth(_label); End Method
	
	'Summary:
	Method width:Int(); Return _width + TextWidth(_label) + DEFAULTGADSIZE; End Method
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_Slider Extends GUI_Properties
	
	Field _cmdAdd:GUI_Button = New GUI_Button
	Field _cmdSub:GUI_Button = New GUI_Button
	Field _maxValue:Int
	Field _vertBar%
	Field _knobSize:Int = DEFAULTGADSIZE
	Field _increment:Int
	
	'Public
	
	'Summary:
	Method Create (x:Int, y:Int, Length:Int, maxValue:Int, verticalBar% = True)
		_id = SetGadgetID()
		_maxValue = maxValue
		If verticalBar = True
			_width = DEFAULTGADSIZE
			_height = Length - DEFAULTGADSIZE
			_cmdAdd.Create(x, y, DEFAULTGADSIZE, "@!U", DEFAULTGADSIZE)
			_cmdSub.Create(x, y + _height, DEFAULTGADSIZE, "@!D", DEFAULTGADSIZE)
			_height = Length - (DEFAULTGADSIZE * 2)
			_y = y + DEFAULTGADSIZE
			_x = x
			_increment = ( (Float(_height) - Float(DEFAULTGADSIZE)) / Float(_maxValue))
			_vertBar = True
		Else
			_width = Length - DEFAULTGADSIZE
			_height = DEFAULTGADSIZE
			_cmdSub.Create(x + _width, y, DEFAULTGADSIZE, "@!R", DEFAULTGADSIZE)
			_cmdAdd.Create(x, y, DEFAULTGADSIZE, "@!L", DEFAULTGADSIZE)
			_width = Length - (DEFAULTGADSIZE * 2)
			_y = y
			_x = x + DEFAULTGADSIZE
			_increment = ( (_width - DEFAULTGADSIZE) / _maxValue)
			_vertBar = False
		End If		
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.Slider(Self)
		_cmdAdd.Render
		_cmdSub.Render
	End Method
	
	'Summary:
	Method Update ()
		If _enabled = False Or _hidden = True Then Return
		If _cmdSub.Update() And _value < _maxValue
			_value = _value + 1
			Return
		EndIf
		If _cmdAdd.Update() And _value > 0
			_value = _value - 1
			Return
		EndIf		
		If SelectedGadgetID = 0
			If MouseOverGadget() And MouseHit(MOUSE_LEFT) Then SelectedGadgetID = _id
		ElseIf SelectedGadgetID = _id
			If MouseDown(MOUSE_LEFT) And _increment > 0
				If _vertBar
					_value = (MouseY() - (_y + (DEFAULTGADSIZE * 0.5))) / _increment
				Else
					_value = (MouseX() - (_x + (DEFAULTGADSIZE * 0.5))) / _increment
				EndIf
				If _value < 0 Then _value = 0
				If _value > _maxValue Then _value = _maxValue
			ElseIf Not MouseDown(MOUSE_LEFT)
				SelectedGadgetID = 0
			EndIf
		EndIf
	
	End Method
	
	'Summary:
	Method GetValue:Int(); Return _value; End Method
	
	'Summary:
	Method SetValue (value:Int)
		_value = value
		If _value < 0 Then value = 0
		If _value > _maxValue Then _value = _maxValue	
	End Method
	
	'Summary:
	Method X:Int()
		If _vertBar Then Return _x Else Return _x - DEFAULTGADSIZE
	End Method
	
	'Summary:
	Method Y:Int()
		If _vertBar Then Return _y - DEFAULTGADSIZE Else Return _y
	End Method
	
	'Summary:
	Method width:Int()
		If _vertBar Then Return DEFAULTGADSIZE Else Return _width + (DEFAULTGADSIZE * 2)
	End Method
	
	'Summary:
	Method height:Int()
		If _vertBar Then Return _height + (DEFAULTGADSIZE * 2) Else Return DEFAULTGADSIZE
	End Method
		
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_DropDown Extends GUI_Properties
	
	Field _itemList:TIntMap ':tTreeMap < Int, String > 'IntMap<String>
	Field _pressed%
	Field _listLineHeight:Int = 18
	Field _showListAbove%
	'Public
	
	Method New()
		_itemList = New TIntMap 'tTreeMap < Int, String >
	End Method
	
	'Summary:
	Method Create (x:Int, y:Int, width:Int)
		_x = x
		_y = y
		_width = width
		_height = DEFAULTGADSIZE
		_id = SetGadgetID()
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.DropDown(Self, 0)
		If _pressed Then Shape.DropDown(Self, 1)
	End Method
	
	'Summary:
	Method Update%()
		If _enabled = False Or _hidden = True Then Return False
		If SelectedGadgetID = 0
			If MouseOverGadget() And MouseHit(MOUSE_LEFT) Then SelectedGadgetID = _id
		ElseIf SelectedGadgetID = _id
			If MouseDown(MOUSE_LEFT) And MouseOverGadget()
				_pressed = True
				_showListAbove = False
				If (_y + _height) + (MapCount(_itemList) * _listLineHeight) > VirtualResolutionWidth() Then _showListAbove = True
			ElseIf Not MouseDown(MOUSE_LEFT)
				SelectedGadgetID = 0
				_pressed = False
			Else
				If _showListAbove
					_index = ((MouseY() - _y) + (MapCount(_itemList) * _listLineHeight)) / _listLineHeight
				Else
					_index = (MouseY() - (_y + _height)) / _listLineHeight
				EndIf
				If _index < 0 Then _index = 0
				If _index >= MapCount(_itemList) Then _index = (MapCount(_itemList) - 1)
			EndIf
		EndIf
	End Method
	
	'Summary:
	Method AddItem (Text:String)
		_itemList.Insert(MapCount(_itemList) + 1, Text)
	End Method
	
	'Summary:
	Method ReplaceItem (index:Int, new_text:String)
		If Index > (MapCount(_itemList) - 1) Or Index < 0 Then Print("!ReplaceItemERROR") ; Return
		_itemList.Insert (Index + 1, new_text)
	End Method
	
	'Summary:
	Method RemoveItem (index:Int)
		If Index > (MapCount(_itemList) - 1) Or Index < 0 Then Print("!RemoveItemERROR") ; Return
		Local list:String[MapCount(_itemList)]
		Local count:Int
		For Local a:Int = 0 Until list.Length
			If a <> index
				list[Count] = String(_itemList.ValueForKey(a + 1))
				count = count + 1
			End If
		Next
		_itemList.Clear
		For Local a:Int = 0 Until list.Length - 1
			AddItem(list[a])
		Next
		If _index > (MapCount(_itemList) - 1) Then SetIndex(0)
	End Method
	
	'Summary:
	Method RemoveAll ()
		_itemList.Clear
		SetIndex(0)
	End Method
	
	'Summary:
	Method SetIndex (Index%) ; _index = Index; End Method
	
	'Summary:
	Method GetIndex:Int(); Return _index; End Method
	
	'Summary:
	Method GetText:String() ; Return String(_itemList.ValueForKey (_index + 1)) ; End Method
	
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_CheckBox Extends GUI_Properties
	
	'Summary:
	Method Create (x:Int, y:Int, label:String = "", width:Int = DEFAULTGADSIZE)
		If label.Length > 0
			_label = StrMid(label, 1, ( (width - DEFAULTGADSIZE) / _textWidth) - 1)
		EndIf
		If width <= (DEFAULTGADSIZE*2) Then _label = ""
		_x = x
		_y = y
		_width = DEFAULTGADSIZE
		_height = DEFAULTGADSIZE
		_id = SetGadgetID()
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.CheckBox(Self)
	End Method
	
	'Summary:
	Method Update%()
		If _enabled = False Or _hidden = True Then Return False
		If SelectedGadgetID = 0
			If MouseOverGadget() And MouseHit(MOUSE_LEFT)
				If _state = 0 Then _state = 1 Else _state = 0
			EndIf
		EndIf
	End Method
	
	'Summary:
	Method SetState (state:Int); _state = state; End Method
	
	'Summary:
	Method GetState:Int(); Return _state; End Method
	
	'Summary:
	Method X:Int(); Return _x; End Method
	
	'Summary:
	Method width:Int()
		If _label.Length = 0 Return _width
		Return _width + TextWidth(_label) + _textWidth + 4
	End Method
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_ListBox Extends GUI_Properties
	
	Field _itemList:TIntMap  ':tTreeMap < Int, String > 'New IntMap<String>
	Field _listLineHeight:Int = 18
	Field _slider:GUI_Slider = New GUI_Slider
	Field _visableItemCount:Int
	Field _listOffset:Int
	Field _selectedIndex:Int
	'Public
	
	Method New()
		_itemList = New TIntMap'tTreemap < Int, String >
	End Method
	
	'Summary:
	Method Create (x:Int, y:Int, width:Int, height:Int)
		_x = x
		_y = y
		_width = width - DEFAULTGADSIZE
		_height = height
		_id = SetGadgetID()
		_slider.Create(_x + _width, _y, _height, 0)
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.ListBox(Self)
		_slider.Render
	End Method
	
	'Summary:
	Method Update%()
		If _enabled = False Or _hidden = True Then Return False
		If SelectedGadgetID = 0
			If MouseOverGadget() And MouseHit(MOUSE_LEFT)
				_index = ( (MouseY() - (_y)) / _listLineHeight)
				If _index < 0 Then _index = 0
				If _index >= _visableItemCount Then _index = _visableItemCount - 1
				If _index >= MapCount(_itemList) Then _index = MapCount(_itemList) - 1
				_selectedIndex = _index + _listOffset
			EndIf
		EndIf
		_slider.Update
		_listOffset = _slider.GetValue()
	End Method
	
	'Summary:
	Method AddItem (Text:String)
		_itemList.Insert(MapCount(_itemList) + 1, Text)
		_visableItemCount = _height / _listLineHeight
		_slider.Create(_x + _width, _y, _height, MapCount(_itemList) - _visableItemCount)
		_listOffset = 0
	End Method
	
	'Summary:
	Method ReplaceItem (index:Int, new_text:String)
		If Index > (MapCount(_itemList) - 1) Or Index < 0 Then Print "!ReplaceItemERROR"; Return
		_itemList.Insert(Index + 1, new_text)
	End Method
	
	'Summary:
	Method RemoveAll ()
		_itemList.Clear
		_index = 0
		_selectedIndex = 0
		_visableItemCount = 0
		_listOffset = 0
		_slider.Create(_x + _width, _y, _height, 0)
		_slider.SetValue(0)
	End Method
	
	'Summary:
	Method RemoveItem (index:Int)
		If Index > (MapCount(_itemList) - 1) Or Index < 0 Then Print "!RemoveItemERROR"; Return
		Local list:String[MapCount(_itemList)]
		Local count:Int
		For Local a:Int = 0 Until list.Length
			If a <> index
				list[Count] = String(_itemList.ValueForKey(a + 1))
				Count = Count + 1
			End If
		Next
		_itemList.Clear
		For Local a:Int = 0 Until list.Length - 1
			AddItem(list[a])
		Next
		_index = 0
		_selectedIndex = 0
		_listOffset = 0
		If MapCount(_itemList) - _visableItemCount <= 0 Then _slider.Create(_x + _width, _y, _height, 0)
		_slider.SetValue(0)
	End Method
	
	'Summary:
	Method GetIndex:Int(); Return _selectedIndex; End Method
	
	'Summary:
	Method GetText:String() ; Return String(_itemList.ValueForKey(_selectedIndex + 1)) ; End Method
	
	'Summary:
	Method X:Int(); Return _x; End Method
	
	'Summary:
	Method width:Int() Return _width + DEFAULTGADSIZE; End Method
End Type

'="=================================================================================================—
'=š=================================================================================================

Type GUI_Label Extends GUI_Properties
	Method Create (x:Int, y:Int, width:Int, Text:String = "")
		_x = x
		_y = y
		_width = width
		_height = DEFAULTGADSIZE
		_id = SetGadgetID()
		_text = Text
	End Method
	
	'Summary:
	Method Render ()
		If _hidden = True Then Return
		Shape.DrawLabel(StrMid(_text, 1, _width / _textWidth), _x, _y, _width, _height)
	End Method
	
	'Summary:
	Method SetText (Text:String); _text = Text; End Method
	
	'Summary:
	Method GetText:String(); Return _text; End Method

End Type

Function MapCount%(m:TIntMap)
	Local c%
	For Local i:Object = EachIn m.Keys()
		c=c+1
	Next
	Return c
End Function
