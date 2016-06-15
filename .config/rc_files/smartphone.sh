function _rc_smartphone_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_SMARTPHONE_BACKUPS_DIRECTORY="/private/backups/xperia_z3+_dual"

  if [[ ! -d ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    _rc_smartphone_umount
    sleep 5
    adb kill-server
    sleep 5
    _rc_smartphone_mount
    sleep 5
    echo "Going to execute tar."
    tar --create --directory ~/mnt/xperia_z3+_dual "Internal storage" | xz --best > ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/internal_storage.tar.xz
    _rc_smartphone_umount
    sleep 5
    adb devices
    sleep 5
    adb backup -f ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/android.ab -apk -obb -noshared -all -system
    sleep 5
    _rc_smartphone_umount
    sleep 5
    adb kill-server
    echo "Now you can disconnect your smartphone."
    xz --best ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/android.ab
    xzcat ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/android.ab.xz | dd ibs=24 skip=1 | openssl zlib -d | xz --best > ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/android.tar.xz

    [[ `ls ${_RC_SMARTPHONE_BACKUPS_DIRECTORY} | wc --lines` -ge 31 ]] && find ${_RC_SMARTPHONE_BACKUPS_DIRECTORY} -maxdepth 1 -mindepth 1 -mtime +200 -exec rm --force --recursive {} +

    mc ${_RC_SMARTPHONE_BACKUPS_DIRECTORY} ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}

function _rc_smartphone_mount
{
  jmtpfs ~/mnt/xperia_z3+_dual
}

function _rc_smartphone_umount
{
  sync
  fusermount -u ~/mnt/xperia_z3+_dual
}
