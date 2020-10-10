function _rc_create_backup_mm
{
  _RC_CURRENT_DATE_STAMP=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_MM_BACKUPS_DIRECTORY="/private/backups/mm"

  [[ $(sudo whoami) != "root" ]] && return 1

  if [[ ! -d ${_RC_MM_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir "${_RC_MM_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
    sudo tar --create --directory ~/Nextcloud/nosync --exclude mm/big_data mm | xz --best > "${_RC_MM_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mm.tar.xz"
    cp --force --recursive ~/Nextcloud/nosync/mm/big_data/database/* "${_RC_MM_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
    _util_clear_old_backups ${_RC_MM_BACKUPS_DIRECTORY}
    mkdir --parents /mnt/luksextra1/xtr1/backups/mm
    cp --force --recursive "${_RC_MM_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}" /mnt/luksextra1/xtr1/backups/mm
    mc ${_RC_MM_BACKUPS_DIRECTORY} "${_RC_MM_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
  fi
}
