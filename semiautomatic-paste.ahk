;SendMode Play ; Input mode Play works better for me on Windows 7 but worse on Windows 8.
SetWorkingDir, C:\Users\username\Documents\

AutoAdvance = 1
File1  := "foldername\file1.html"
File2  := "foldername\file2.html"
File3  := "foldername\file3.html"

Gui, +AlwaysOnTop
Gui, Font, s14
Gui, Add, DropDownList, vFileDropdown gGuiSubmit w500 AltSubmit HwndFileDropdownHwnd
Gui, Font, s8
Gui, Add, Checkbox, vAutoAdvance gGuiSubmit checked, Auto-advance
Loop, 3 ; IMPORTANT: set this number to the number of files you have
{
	GuiControl, , FileDropdown, % File%A_Index%
}
GuiControl, Choose, FileDropdown, %File1%
Gui, Show,, Semiautomatic Paste

GuiSubmit:
	Gui, Submit, NoHide
	FileIndex := FileDropdown
	Gosub, GuiUpdate
	;TrayTip, Semiautomatic Paste, Auto-advance: %AutoAdvance%. FileIndex: %FileIndex%. File name: %FileName%
return

GuiUpdate:
	FileN := File%FileIndex%
	GuiControl, ChooseString, ComboBox1, %FileN%
return

>!r::Reload
>!e::Edit

#v::
	Send, ^a ; select all
	FileName := File%FileIndex%
	FileRead, Clipboard, %FileName%
	Send, ^v
	if (AutoAdvance) {
		FileIndex++
	}
	Gosub, GuiUpdate
return

GuiClose:
ExitApp
