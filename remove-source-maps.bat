rem del build\*.map

@echo off

:enterDir

	for %%f in (*.map) do (

		call :printFile %%f
		del %%f
	)

	for /D %%d in (*) do (

		if  %%d NEQ node_modules (
			cd %%d

			call :enterDir %%d

			cd ..
		)
	)

exit /b

:printFile
	set f=....................... %1
	set space =

	@echo | set /p a = DELETED %space%
	@echo | set /p b = [ %f:~-24% ] %space%
	@echo | set /p c = FROM %space%
	@echo "%~dpnx1"
exit /b