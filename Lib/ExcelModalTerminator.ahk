; Get rid of unwanted Excel pop-ups

ExcelModalTerminator()
{
	If (WinExist("Microsoft Excel", "There is a large amount of information on the Clipboard"))
	{
		WinActivate()
		Send "{Enter}"
	}
}