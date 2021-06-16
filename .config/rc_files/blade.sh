function _rc_create_backup_blade
{
  _RC_CURRENT_DATE_STAMP=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_BLADE_BACKUPS_DIRECTORY="/private/backups/blade"

  if [[ ! -d ${_RC_BLADE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir "${_RC_BLADE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
    tar --create --directory /private/projects --exclude blade/.git --exclude blade/node_modules blade | xz --best > "${_RC_BLADE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/blade.tar.xz"
    _util_clear_old_backups ${_RC_BLADE_BACKUPS_DIRECTORY}
    mkdir --parents /mnt/luksextra1/xtr1/backups/blade
    cp --force --recursive "${_RC_BLADE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}" /mnt/luksextra1/xtr1/backups/blade
    mc ${_RC_BLADE_BACKUPS_DIRECTORY} "${_RC_BLADE_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
  fi
}
