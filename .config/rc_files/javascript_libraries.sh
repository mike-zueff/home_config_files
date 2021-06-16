function _rc_create_backup_javascript_libraries
{
  _RC_CURRENT_DATE_STAMP=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY="/private/backups/javascript_libraries"

  if [[ ! -d ${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir "${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
    tar --create --directory /private/projects --exclude javascript_libraries/.git javascript_libraries | xz --best > "${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/javascript_libraries.tar.xz"
    _util_clear_old_backups ${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY}
    mkdir --parents /mnt/luksextra1/xtr1/backups/javascript_libraries
    cp --force --recursive "${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}" /mnt/luksextra1/xtr1/backups/javascript_libraries
    mc ${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY} "${_RC_JAVASCRIPT_LIBRARIES_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
  fi
}
