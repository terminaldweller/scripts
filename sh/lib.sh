#!/bin/sh

# copy_glibc_deps $STASH $DEST_VM
copy_glibc_deps() {
  for GLIBC_LIB in $GLIBC_LIST; do
    if [ ! -f $1/$GLIBC_LIB ]; then
      echo "GLIBC_LIB: "$LINUX_LIB_PATH/$GLIBC_LIB
      $zscp $2:$LINUX_LIB_PATH/$GLIBC_LIB $1
    fi
  done
}

# copy_deps_to_stash $DEPENDENCY_LIST $STASH $SRC_VM
copy_deps_to_stash() {
  echo copy_deps_to_stash
  for DEP in $1; do
    echo "DEP: "$DEP
    if [ ! -f $2/$(basename $DEP) ]; then
      $zscp $3:$DEP $2
    fi

    L2_DEP_LIST=$($zssh $3 "ldd $DEP" | awk '{print $3}')
    for DEP2 in $L2_DEP_LIST; do
      echo "DEP2: "$DEP2
      if [ ! -f $2/$(basename $DEP2) ]; then
        $zscp $3:$DEP2 $2
      fi
    done
  done
}

# copy_to_stash $ABS_PATH_TO_EXECUTALE $DEPENDENCY_LIST $STASH $SRC_VM
copy_to_stash() {
  $zscp $4:$1 $3
  copy_deps_to_stash "$2" $3 $4
}

# copy_from_stash $STASH $DEST
copy_from_stash() {
  $zscp $1 $ROUTER:$2
}

# copy_pam_mod_deps $PAM_SERVICE $STASH $SRC_VM
copy_pam_mod_deps() {
  MODS=$($zssh $ROUTER "cat /etc/pam.d/$1 | grep -o 'pam_.*\.so'")
  echo MODS": "$MODS

  for MOD in $MODS; do
    MOD_ABS=$LIB_SECURITY_PATH/$MOD
    echo $MOD_ABS
    DEP_LIST=$($zssh $3 "ldd $MOD_ABS" | awk '{print $3}')
    echo DEPS": "$DEP_LIST
    copy_to_stash $MOD_ABS "$DEP_LIST" $2 $3
  done
}
