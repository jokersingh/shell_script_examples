@echo off
echo "deleting files which is older then 1 day"
@REM "To change date update value for /D"
@REM "To change file name update value for -m"
forfiles -p "C:\workspace\batch_script\batch" -s -m b*.* /D -1 /C "cmd /c del /f @path"
echo "deletion done"
