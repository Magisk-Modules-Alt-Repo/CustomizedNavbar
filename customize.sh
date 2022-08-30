MODDIR=${0%/*}
# Finding directory of overlays
ui_print " "
ui_print "   Find target directory of the overlays ... "
ui_print " "
sleep 1
  if  [ -d  /system/vendor/overlay ]; then
    ui_print "   Overlays found in vendor"
    ui_print " "
    TARGET=$MODPATH/system/vendor
    mv $MODPATH/system/folder $TARGET
    sleep 1
    ui_print "   Files will be copied to vendor"
    ui_print " "
  elif [ -d  /system/product/overlay ]; then
    ui_print "   Overlays found in product"
    ui_print " "
    TARGET=$MODPATH/system/product
    mv $MODPATH/system/folder $TARGET
    sleep 1
    ui_print "   Files will be copied to product"
    ui_print " "
  else
    ui_print "   Overlays not found"
    ui_print "   Installation aborting"
    abort
  fi;
sleep 1
# Key-Selector addon starting
. $MODPATH/addon/Volume-Key-Selector/install.sh
ui_print "   What overlays to use?"
ui_print " "
sleep 1
ui_print "   Volume up (+) to change selection"
ui_print "   Volume down (-) to decide"
ui_print " "
sleep 1
# First overlay
ui_print "   Install Colored overlay?"
ui_print " "

A=1
  while true; do
    case $A in
      2 ) TEXT="   No, skip this step";;
      1 ) TEXT="   Yes, install";;
    esac
      ui_print "   $A - $TEXT"
        if $VKSEL; then
          A=$((A + 1))
        else
          break
        fi
        if [ $A -gt 2 ]; then
          A=1
        fi
  done

  case $A in
    2 ) echo "   Colored NavBar overlay SKIPED" > $MODPATH/install.log; rm -r $TARGET/overlay/NavbarColorOverlay;;
    1 ) echo "   Colored NavBar overlay INSTALLED" > $MODPATH/install.log;;
  esac
# Second overlay
ui_print " "
sleep 1
ui_print "   Install Wided overlay?"
ui_print " "

A=1
  while true; do
    case $A in
      2 ) TEXT="   No, skip this step";;
      1 ) TEXT="   Yes, install";;
    esac
      ui_print "   $A - $TEXT"
      if $VKSEL; then
        A=$((A + 1))
      else
        break
      fi
      if [ $A -gt 2 ]; then
        A=1
      fi
  done

  case $A in
    2 ) echo "   Wided NavBar overlay SKIPED" >> $MODPATH/install.log; rm -r $TARGET/overlay/NavbarWidthOverlay;;
    1 ) echo "   Wided NavBar overlay INSTALLED" >> $MODPATH/install.log;;
  esac
# Third overlay
ui_print " "
sleep 1
ui_print "   Install Thickned overlay?"
ui_print " "

A=1
  while true; do
    case $A in
      2 ) TEXT="   No, skip this step";;
      1 ) TEXT="   Yes, install";;
    esac
      ui_print "   $A - $TEXT"
      if $VKSEL; then
        A=$((A + 1))
      else
        break
      fi
      if [ $A -gt 2 ]; then
        A=1
      fi
  done

  case $A in
    2 ) echo "   Thickned NavBar overlay SKIPED" >> $MODPATH/install.log; rm -r $TARGET/overlay/NavbarHeigthOverlay;;
    1 ) echo "   Thickned NavBar overlay INSTALLED" >> $MODPATH/install.log;;
  esac
# Result
sleep 1
ui_print " "
ui_print "   You have selected:"
ui_print " "
cat $MODPATH/install.log
ui_print " "
# Clean temporary directory
rm -r $MODPATH/addon
rm $MODPATH/install.log