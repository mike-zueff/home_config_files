function _rc_create_backup_poisk
{
  _RC_CURRENT_DATE_STAMP=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_POISK_BACKUPS_DIRECTORY="/private/backups/poisk"

  if [[ ! -d ${_RC_POISK_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir "${_RC_POISK_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
    tar --create --directory /private/projects --exclude poisk/.git poisk | xz --best > "${_RC_POISK_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/poisk.tar.xz"
    _util_clear_old_backups ${_RC_POISK_BACKUPS_DIRECTORY}
    mkdir --parents /mnt/luksextra1/xtr1/backups/poisk
    cp --force --recursive "${_RC_POISK_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}" /mnt/luksextra1/xtr1/backups/poisk
    mc ${_RC_POISK_BACKUPS_DIRECTORY} "${_RC_POISK_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
  fi
}
