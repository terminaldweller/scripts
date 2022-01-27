# gef
#source /home/devi/gef/gef.py
# gef config context.libc_args 1
# gef config context.enable 0
# gef config context.nb_lines_threads 4
# gef config context.use_capstone 1

# voltron
#source /usr/local/lib/python3.8/dist-packages/voltron/entry.py

add-auto-load-safe-path /home/devi/scripts/.gdbinit

# load custom scripts
python
import glob
python_dir = "/home/devi/scripts/gdb"
py_files = glob.glob(f"{python_dir}/*.py")
for py_file in py_files:
  gdb.execute(f'source {py_file}')
end

# configs
set listsize 13
set follow-fork-mode child
set pagination off
set detach-on-fork on
set breakpoint pending on
set disassembly-flavor intel
# set exec-direction reverse
# set backtrace-past-main on
# set backtrace-past-entry on
set mi-async on
set print pretty on
set confirm off
set verbose off
set history save on
set history expansion on
set history size 10000
set history filename ~/.gdb_history
set output-radix 0x10
set input-radix 0x10
set height 0
set width 0

# prompt
# set prompt \033[34m\033[1mGDB >>>\033[0m 
set prompt GDB >>> 

# styles
set style tui-border background green

define hook-stop
  list
  backtrace
end

# load gdbundle
# python
# import os,subprocess,sys
# paths = subprocess.check_output('python -c "import os,sys;print(os.linesep.join(sys.path))"')
# sys.path.extend(paths)
# import gdbundle
# gdbundle.init()
# end

define btall
  thread apply all backtrace
end

# custom signals
# handle SIGUSR1 nopass
# handle SIGUSR2 nopass
# handle SIGUSR3 nopass
# handle SIGUSR4 nopass
# handle SIGUSR5 nopass

# kill all inferiors before exit
# define hook-quit
# python
# import subprocess
# inferiors = gdb.inferiors()
# for inferior in inferiors:
#   subprocess.run(["kill","-9",repr(intferior.pid)])
# end
# end

#record
