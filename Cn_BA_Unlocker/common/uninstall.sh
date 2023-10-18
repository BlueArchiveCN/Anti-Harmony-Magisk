#!/system/bin/sh
on_uninstall() {
  touch /sdcard/uninstall_test.txt
  echo "Uninstall script executed successfully!" >/sdcard/uninstall_test.txt

  if [ ! -d "/data/media/0/Android/data/com.RoamingStar.BlueArchive" ] && [ ! -d "/data/media/0/Android/data/com.RoamingStar.BlueArchive.bilibili" ]; then
    abort "未检测到游戏"
  else
    touch "${MODPATH}/remove"
    ui_print "替换回原有文件"
    if [ -d "/sdcard/Documents/BA-backups/" ]; then
      rm /data/media/0/Android/data/com.RoamingStar.BlueArchive/files/LocalizeConfig.txt
      cp /sdcard/Documents/BA-backups/* /data/media/0/Android/data/com.RoamingStar.BlueArchive/files/
      rm -rf "/sdcard/Documents/BA-backups/"
    fi

    if [ -d "/sdcard/Documents/BA-b-backups/" ]; then
      rm /data/media/0/Android/data/com.RoamingStar.BlueArchive.bilibili/files/LocalizeConfig.txt
      cp /sdcard/Documents/BA-b-backups/* /data/media/0/Android/data/com.RoamingStar.BlueArchive.bilibili/files/
      rm -rf "/sdcard/Documents/BA-b-backups/"
    fi
  fi
}
