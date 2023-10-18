#!/system/bin/sh
on_uninstall() {
  touch /sdcard/uninstall_test.txt
  echo "Uninstall script executed successfully!" >/sdcard/uninstall_test.txt

  if [ ! -d "/data/media/0/Android/data/com.RoamingStar.BlueArchive" ] && [ ! -d "/data/media/0/Android/data/com.RoamingStar.BlueArchive.bilibili" ]; then
    ui_print "未检测到备份文件夹"
    rm -f /data/media/0/Android/data/com.RoamingStar.BlueArchive/files/AssetBundls/*
    rm -f /data/media/0/Android/data/com.RoamingStar.BlueArchive.bilibili/files/AssetBundls/*
  else
    touch "${MODPATH}/remove"
    ui_print "替换回原有文件"
    if [ -d "/sdcard/Documents/BA-backups/" ]; then
      mv -f "/sdcard/Documents/BA-backups/"* "/data/media/0/Android/data/com.RoamingStar.BlueArchive/files/AssetBundls/"
      rm -rf "/sdcard/Documents/BA-backups/"
    fi

    if [ -d "/sdcard/Documents/BA-b-backups/" ]; then
      mv -f "/sdcard/Documents/BA-b-backups/"* "/data/media/0/Android/data/com.RoamingStar.BlueArchive.bilibili/files/AssetBundls/"
      rm -rf "/sdcard/Documents/BA-b-backups/"
    fi
  fi
}
