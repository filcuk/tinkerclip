; Get rid of unwanted Excel pop-ups

PBISecurityRisk()
{
	If (WinExist("Potential security risk"))
	{
		WinActivate()
		Send "{Tab}{Tab}{Enter}"
	}
}