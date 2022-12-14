function _rc_create_backup_eigengrau
{
  _RC_CURRENT_DATE_STAMP=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_EIGENGRAU_BACKUPS_DIRECTORY="/private/backups/eigengrau"

  if [[ ! -d ${_RC_EIGENGRAU_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir "${_RC_EIGENGRAU_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
    tar --create --directory /zfs --exclude eigengrau/.git eigengrau | xz --best > "${_RC_EIGENGRAU_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/eigengrau.tar.xz"
    _util_clear_old_backups ${_RC_EIGENGRAU_BACKUPS_DIRECTORY}
    mc ${_RC_EIGENGRAU_BACKUPS_DIRECTORY} "${_RC_EIGENGRAU_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
  fi
}
