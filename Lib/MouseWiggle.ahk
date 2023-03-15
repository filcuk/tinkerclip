; Wiggle mouse when idle

InstallKeybdHook
InstallMouseHook

MWIdleThreshold := 1000 * 3
MWMove := 100

MouseWiggle() {
	global TrayIdle

	If (A_TimeIdle > MWIdleThreshold && TrayIdle)
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