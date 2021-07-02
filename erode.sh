#!/bin/bash

# ERODE.SH

# This Bash script will help you cleanly uninstall e25.

# See README.md for instructions on how to use this script.

# erode.sh is written and maintained by carlasensa@sfr.fr and batden@sfr.fr,
# feel free to use this script as you see fit.

ITA="\e[3m"
BDR="\e[1;31m"
OFF="\e[0m"

SCRFLR=$HOME/.iggy
LAVF=0.9.1

PROG_MN="efl terminology enlightenment ephoto evisum rage express ecrire entice"
PROG_AT="enventor"

remov_eprog_at() {
  for I in $PROG_AT; do
    sudo make uninstall &>/dev/null
  done
}

remov_eprog_mn() {
  for I in $PROG_MN; do
    sudo ninja -C build uninstall &>/dev/null
  done
}

remov_preq() {
  if [ -d $ESRC/rlottie ]; then
    echo
    read -t 12 -p "Remove rlottie, libavif and aom? [Y/n] " answer
    case $answer in
    [yY])
      echo
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie
      echo

      cd $ESRC/libavif-$LAVF/build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf libavif-$LAVF
      echo

      cd $ESRC/aom/aom-build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf aom
      echo
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not remove prerequisites... OK)"
      ;;
    *)
      echo
      cd $ESRC/rlottie
      sudo ninja -C build uninstall &>/dev/null
      cd .. && rm -rf rlottie
      echo

      cd $ESRC/libavif-$LAVF/build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf libavif-$LAVF
      echo

      cd $ESRC/aom/aom-build
      sudo xargs rm -rf <install_manifest.txt
      cd ../.. && rm -rf aom
      echo
      ;;
    esac
  fi
}

uninstall_e25() {
  if [ "$XDG_CURRENT_DESKTOP" == "Enlightenment" ]; then
    printf "$BDR%s $OFF%s\n\n" "PLEASE LOG IN TO THE DEFAULT DESKTOP ENVIRONMENT TO EXECUTE THIS SCRIPT."
    beep_exit
    exit 1
  fi

  ESRC=$(cat $HOME/.cache/ebuilds/storepath)

  clear
  printf "\n\n$BDR%s $OFF%s\n\n" "* UNINSTALLING ENLIGHTENMENT DESKTOP *"

  cd $HOME

  for I in $PROG_AT; do
    cd $ESRC/e25/$I && remov_eprog_at
  done

  for I in $PROG_MN; do
    cd $ESRC/e25/$I && remov_eprog_mn
  done

  cd /etc
  sudo rm -rf enlightenment

  cd /etc/xdg/menus
  sudo rm -rf e-applications.menu

  cd /usr/local/bin
  sudo rm -rf e_paledit*
  sudo rm -rf eina*
  sudo rm -rf efl*
  sudo rm -rf elua*
  sudo rm -rf enventor*
  sudo rm -rf eolian*
  sudo rm -rf emotion*
  sudo rm -rf evas*
  sudo rm -rf terminology*
  sudo rm -rf ty*

  cd /usr/local/etc
  sudo rm -rf enlightenment

  # cd /usr/local/include
  # sudo rm -rf -- *-1
  # sudo rm -rf aom
  # sudo rm -rf avif
  # sudo rm -rf enlightenment
  # sudo rm -rf rlottie*

  # cd /usr/local/lib64
  # sudo rm -rf ecore*
  # sudo rm -rf edje*
  # sudo rm -rf eeze*
  # sudo rm -rf efl*
  # sudo rm -rf efreet*
  # sudo rm -rf elementary*
  # sudo rm -rf emotion*
  # sudo rm -rf enlightenment*
  # sudo rm -rf enventor*
  # sudo rm -rf ephoto*
  # sudo rm -rf ethumb*
  # sudo rm -rf evas*
  # sudo rm -rf libecore*
  # sudo rm -rf libector*
  # sudo rm -rf libedje*
  # sudo rm -rf libeet*
  # sudo rm -rf libeeze*
  # sudo rm -rf libefl*
  # sudo rm -rf libefreet*
  # sudo rm -rf libeina*
  # sudo rm -rf libeio*
  # sudo rm -rf libeldbus*
  # sudo rm -rf libelementary*
  # sudo rm -rf libelocation*
  # sudo rm -rf libelput*
  # sudo rm -rf libelua*
  # sudo rm -rf libembryo*
  # sudo rm -rf libemile*
  # sudo rm -rf libemotion*
  # sudo rm -rf libenventor*
  # sudo rm -rf libeo*
  # sudo rm -rf libeolian*
  # sudo rm -rf libephysics*
  # sudo rm -rf libethumb*
  # sudo rm -rf libevas*
  # sudo rm -rf libexactness*
  # sudo rm -rf librlottie*
  # sudo rm -rf rage*

  # cd /usr/local/lib64/cmake
  # sudo rm -rf Ecore*
  # sudo rm -rf Edje*
  # sudo rm -rf Eet*
  # sudo rm -rf Eeze*
  # sudo rm -rf Efl*
  # sudo rm -rf Efreet
  # sudo rm -rf Eina*
  # sudo rm -rf Eio*
  # sudo rm -rf Eldbus*
  # sudo rm -rf Elementary*
  # sudo rm -rf Elua*
  # sudo rm -rf Emile*
  # sudo rm -rf Emotion*
  # sudo rm -rf Eo*
  # sudo rm -rf Eolian*
  # sudo rm -rf Emile*
  # sudo rm -rf Ethumb*
  # sudo rm -rf Evas*
  # sudo rm -rf libavif

  # cd /usr/local/lib64/pkgconfig
  # sudo rm -rf ecore*
  # sudo rm -rf ector*
  # sudo rm -rf edje*
  # sudo rm -rf eet*
  # sudo rm -rf eeze*
  # sudo rm -rf efl*
  # sudo rm -rf efreet*
  # sudo rm -rf eina*
  # sudo rm -rf eio*
  # sudo rm -rf eldbus*
  # sudo rm -rf elementary*
  # sudo rm -rf elocation*
  # sudo rm -rf elua*
  # sudo rm -rf embryo*
  # sudo rm -rf emile*
  # sudo rm -rf emotion*
  # sudo rm -rf enlightenment*
  # sudo rm -rf enventor*
  # sudo rm -rf evisum*
  # sudo rm -rf eo*
  # sudo rm -rf eolian*
  # sudo rm -rf ephoto*
  # sudo rm -rf ethumb*
  # sudo rm -rf evas*
  # sudo rm -rf everything*
  # sudo rm -rf exactness*
  # sudo rm -rf rage*
  # sudo rm -rf rlottie*
  # sudo rm -rf terminology*

  # cd /usr/local/share
  # sudo rm -rf dbus*
  # sudo rm -rf ecore*
  # sudo rm -rf edje*
  # sudo rm -rf eeze*
  # sudo rm -rf efl*
  # sudo rm -rf efreet*
  # sudo rm -rf elementary*
  # sudo rm -rf elua*
  # sudo rm -rf embryo*
  # sudo rm -rf emotion*
  # sudo rm -rf enlightenment*
  # sudo rm -rf enventor*
  # sudo rm -rf evisum*
  # sudo rm -rf eo*
  # sudo rm -rf eolian*
  # sudo rm -rf ephoto*
  # sudo rm -rf ethumb*
  # sudo rm -rf evas*
  # sudo rm -rf exactness*
  # sudo rm -rf rage*
  # sudo rm -rf terminology*
  # sudo rm -rf wayland-sessions*

  cd /usr/local/share/applications
  sudo sed -i '/enlightenment_filemanager/d' mimeinfo.cache
  sudo sed -i '/ecrire/d' mimeinfo.cache
  sudo sed -i '/entice/d' mimeinfo.cache
  sudo sed -i '/ephoto/d' mimeinfo.cache
  sudo sed -i '/rage/d' mimeinfo.cache
  sudo rm -rf e_paledit.desktop
  sudo rm -rf terminology.desktop

  cd /usr/local/share/icons
  sudo rm -rf Enlightenment*
  sudo rm -rf elementary*
  sudo rm -rf terminology*

  cd /usr/local/share/icons/hicolor/128x128/apps
  sudo rm -rf evisum.png
  sudo rm -rf terminology.png

  # cd /usr/local/share/man/man1
  # sudo rm -rf terminology*
  # sudo rm -rf ty*

  # cd /usr/local/share/mime/packages
  # sudo rm -rf edje.xml

  cd /usr/include
  sudo rm -rf libinput.h
  sudo rm -rf wayland-client-core.h
  sudo rm -rf wayland-client.h
  sudo rm -rf wayland-client-protocol.h
  sudo rm -rf wayland-cursor.h
  sudo rm -rf wayland-server-core.h
  sudo rm -rf wayland-server.h
  sudo rm -rf wayland-server-protocol.h
  sudo rm -rf wayland-util.h
  sudo rm -rf wayland-version.h
  sudo rm -rf xkbcommon

  cd /usr/lib64
  sudo rm -rf libavif*
  sudo rm -rf libcharset*
  sudo rm -rf libecore*
  sudo rm -rf libector*
  sudo rm -rf libedje*
  sudo rm -rf libeet*
  sudo rm -rf libeeze*
  sudo rm -rf libefl*
  sudo rm -rf libefreet*
  sudo rm -rf libeina*
  sudo rm -rf libeio*
  sudo rm -rf libeldbus*
  sudo rm -rf libelementary*
  sudo rm -rf libelput*
  sudo rm -rf libembryo*
  sudo rm -rf libemile*
  sudo rm -rf libemotion*
  sudo rm -rf libenventor*
  sudo rm -rf libeo.so*
  sudo rm -rf libeo_dbg*
  sudo rm -rf libeolian*
  sudo rm -rf libethumb*
  sudo rm -rf libevas*
  sudo rm -rf libexactness*
  sudo rm -rf libiconv*
  sudo rm -rf librlottie*

  cd /usr/lib64/pkgconfig
  sudo rm -rf ecore*
  sudo rm -rf ector*
  sudo rm -rf edje*
  sudo rm -rf eeze*
  sudo rm -rf efl*
  sudo rm -rf efreet*
  sudo rm -rf eina*
  sudo rm -rf eio*
  sudo rm -rf eldbus*
  sudo rm -rf elementary*
  sudo rm -rf elocation*
  sudo rm -rf elput*
  sudo rm -rf elua*
  sudo rm -rf embryo*
  sudo rm -rf emile*
  sudo rm -rf emotion*
  sudo rm -rf enlightenment*
  sudo rm -rf enventor*
  sudo rm -rf evisum*
  sudo rm -rf eo.pc
  sudo rm -rf eolian*
  sudo rm -rf ephoto*
  sudo rm -rf ethumb*
  sudo rm -rf evas*
  sudo rm -rf everything*
  sudo rm -rf exactness*
  sudo rm -rf rage*
  sudo rm -rf rlottie*
  sudo rm -rf terminology*

  cd /usr/share/dbus-1/services
  sudo rm -rf org.enlightenment.Ethumb.service

  cd /usr/share/wayland-sessions &>/dev/null
  sudo rm -rf enlightenment.desktop

  cd /usr/share/xsessions
  sudo rm -rf enlightenment.desktop

  cd $HOME
  rm -rf $ESRC/e25
  rm -rf $SCRFLR
  rm -rf .e
  rm -rf .elementary
  rm -rf .cache/ebuilds
  rm -rf .cache/efreet
  rm -rf .cache/ephoto
  rm -rf .cache/evas_gl_common_caches
  rm -rf .cache/rage
  rm -rf .config/ecrire.cfg
  rm -rf .config/entice
  rm -rf .config/enventor
  rm -rf .config/ephoto
  rm -rf .config/evisum
  rm -rf .config/express
  rm -rf .config/rage
  rm -rf .config/terminology

  remov_preq

  if [ -d $HOME/.ccache ]; then
    echo
    read -t 12 -p "Remove the ccache folder? [y/N] " answer
    case $answer in
    [yY])
      ccache -C
      rm -rf $HOME/.ccache
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      ;;
    *)
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete the ccache folder... OK)"
      ;;
    esac
  fi

  if [ -f $HOME/.bash_aliases ]; then
    echo
    read -t 12 -p "Remove the bash_aliases file? [Y/n] " answer
    case $answer in
    [yY])
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    [nN])
      printf "\n$ITA%s $OFF%s\n\n" "(do not delete bash_aliases... OK)"
      sleep 1
      ;;
    *)
      echo
      rm -rf $HOME/.bash_aliases && source $HOME/.bashrc
      sleep 1
      ;;
    esac
  fi

  find /usr/local/share/locale/*/LC_MESSAGES 2>/dev/null | while read -r I; do
    echo "$I" |
      xargs sudo rm -rf \
        $(grep -E 'efl|enlightenment|enventor|ephoto|evisum|terminology|ecrire')
  done

  sudo ldconfig
  sudo updatedb
  echo
}

printf "\n$BDR%s $OFF%s\n\n" "Wait 3 seconds or hit Ctrl+C to quit..."
sleep 3
uninstall_e25
# Candidates for deletion: Search for 'erode' in your home folder.
# Also have a look at your .bashrc file's contents.
