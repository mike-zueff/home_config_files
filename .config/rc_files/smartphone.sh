function _rc_smartphone_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_SMARTPHONE_BACKUPS_DIRECTORY="/private/backups/xperia_z3+_dual"

  adb kill-server

  if [[ ! -d ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    adb devices
    echo "Please look at your smartphone."
    sleep 5
    adb backup -f ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/backup.ab -apk -shared -all -system
    adb kill-server
    dd ibs=24 if=${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/backup.ab skip=1 | openssl zlib -d -out ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/backup.tar

    [[ `ls ${_RC_SMARTPHONE_BACKUPS_DIRECTORY} | wc --lines` -gt 20 ]] && find ${_RC_SMARTPHONE_BACKUPS_DIRECTORY} -maxdepth 1 -mindepth 1 -mtime +100 -exec rm --force --recursive "{}" \+

    mc ${_RC_SMARTPHONE_BACKUPS_DIRECTORY} ${_RC_SMARTPHONE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}

function _rc_smartphone_mount
{
  jmtpfs ~/mnt/xperia_z3+_dual
}

function _rc_smartphone_umount
{
  fusermount -u ~/mnt/xperia_z3+_dual
}
