#!/usr/bin/sh

CC=clang
CXX=clang++
C_EXT=c
CXX_EXT=cpp
EXTENSION=
CTAGS_I_PATH=./
RECURSIVE=false
while [[ $# -gt 0 ]]
do
  passarg="$1"
  case $passarg in
    --dir)
      CTAGS_I_PATH="$2"
      shift
      ;;
    --lang)
      LANG="$2"
      shift
      ;;
    --cc)
      CC="$2"
      shift
      ;;
    --cxx)
      CXX="$2"
      shift
      ;;
    --recursive|-r)
      RECURSIVE=true
      ;;
    --ex)
      EXTENSION="$2"
      shift
      ;;
  esac
  shift
done

if [[ $LANG == "c" ]];then
  if [[ $EXTENSION == "" ]];then
    EXTENSION="c"
  fi
elif [[ $LANG == "cpp" ]];then
  if [[ $EXTENSION == "" ]];then
    EXTENSION="cpp"
  fi
fi

for file in $CTAGS_I_PATH/*.$EXTENSION;do
  TEMP_FILE=$(mktemp)
  echo $file > $TEMP_FILE
done

if [[ $LANG == "cpp" ]];then
  $CXX -c -I $CTAGS_I_PATH -M $TEMP_FILE| sed -e 's/[\\ ]/\n/g'|sed -e '/^$$/d' -e '/\.o:[ \t]*$$/d'|ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
elif [[ $LANG == "c" ]];then
  $CC -c -I $CTAGS_I_PATH -M $TEMP_FILE|sed -e 's/[\\ ]/\n/g'|sed -e '/^$$/d' -e '/\.o:[ \t]*$$/d'|ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q
fi
