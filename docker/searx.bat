D:\home\apps\cygwin\bin\zsh.exe -c "docker run --rm -d -v ${PWD}/searx:/etc/searx -p 11111:8080 -e BASE_URL=http://localhost:11111/ searx/searx"
pause
