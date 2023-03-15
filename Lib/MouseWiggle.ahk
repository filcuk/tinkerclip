; Wiggle mouse when idle

InstallKeybdHook
InstallMouseHook

MWEnabled := true
MWIdleThreshold := 1000 * 60
MWMove := 100

MouseWiggle()
{
	If (A_TimeIdle > MWIdleThreshold && MWEnabled)
	{
		SendEvent("{Click rel 0, -50, 0}")
		SendEvent("{Click rel 0, 100, 0}")
		SendEvent("{Click rel 0, -50, 0}")
		SendEvent("{Click rel 50, 0, 0}")
		SendEvent("{Click rel -100, 0, 0}")
		SendEvent("{Click rel 50, 0, 0}")

		Sleep(MWIdleThreshold * 0.75)
	}
}