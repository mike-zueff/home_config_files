function _rc_kernel_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_KERNEL_BACKUPS_DIRECTORY="/private/backups/kernel"

  if [[ ! -d ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    cp --force --recursive /boot/efi/EFI/Boot/bootx64.efi ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    cp --force --recursive /boot/efi/EFI/Boot/config ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}

    _util_clear_old_backups ${_RC_KERNEL_BACKUPS_DIRECTORY}

    mc ${_RC_KERNEL_BACKUPS_DIRECTORY} ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}
