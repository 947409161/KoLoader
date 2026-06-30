#!/system/bin/sh

case "$ARCH" in
arm64)
  ui_print "- Selected architecture: arm64-v8a"
  ARCH_BINARY="arm64-v8a"
  ;;
arm)
  ui_print "- Selected architecture: armeabi-v7a"
  ARCH_BINARY="armeabi-v7a"
  ;;
*)
  abort "! Unsupported platform: $ABI"
  ;;
esac

chmod 755 "$MODPATH/bin/$ARCH_BINARY" -R || abort "! Failed to set permissions"
ln -s "./bin/$ARCH_BINARY/ko-loader" "$MODPATH/loader" || abort "! Failed to create symlink"
chmod 755 "$MODDIR/lkm"

