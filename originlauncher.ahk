;Get Origin game exe from cmd line
GameName := A_Args[1]
GamePath := A_Args[2]

;Run the Origin game
Run, %GamePath%\%GameName%

;Sleep for 2 seconds just to make sure origin and the game launches correctly
Sleep, 2000

;Wait for origin and the game to start fully before running our loop
Process, Wait, origin.exe
Process, Wait, %GameName%

;Run a loop every 2 seconds to check if the game is exited (we use sleep to make sure we dont overtax the cpu) then kill origin
Loop{    
    Process, Exist, %GameName%
    GamePID := ErrorLevel
    if (GamePID == 0)
    {
        Process, Close, origin.exe
        break
    }
    Else
        Sleep, 2000
}

Exit