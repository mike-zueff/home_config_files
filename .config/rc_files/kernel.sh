function _rc_kernel_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_KERNEL_BACKUPS_DIRECTORY="/private/backups/kernel"

  if [[ ! -d ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    cp --force --recursive /boot/efi/EFI/Boot/bootx64.efi ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    cp --force --recursive /boot/efi/EFI/Boot/config ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}

    [[ `ls ${_RC_KERNEL_BACKUPS_DIRECTORY} | wc --lines` -ge 31 ]] && find ${_RC_KERNEL_BACKUPS_DIRECTORY} -maxdepth 1 -mindepth 1 -mtime +200 -exec rm --force --recursive {} +

    mc ${_RC_KERNEL_BACKUPS_DIRECTORY} ${_RC_KERNEL_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}
