function _rc_create_backup_nextcloud
{
  _RC_CURRENT_DATE_STAMP=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_NEXTCLOUD_BACKUPS_DIRECTORY="/private/backups/nextcloud"

  [[ $(sudo whoami) != "root" ]] && return 1

  if [[ ! -d ${_RC_NEXTCLOUD_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir "${_RC_NEXTCLOUD_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"

    sudo -u nginx php /var/www/localhost/htdocs/nextcloud/occ maintenance:mode --on
    sudo sed --in-place "s/maintenance' => false/maintenance' => true/g" /var/www/localhost/htdocs/nextcloud/config/config.php
    sudo systemctl stop nginx.service

    sudo sqlite3 /var/www/localhost/htdocs/nextcloud/data/owncloud.db .dump | xz --best > "${_RC_NEXTCLOUD_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/sqlite.dump.xz"
    sudo tar --create --directory /var/www/localhost/htdocs nextcloud | xz --fast > "${_RC_NEXTCLOUD_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/nextcloud.tar.xz"

    sudo systemctl restart nginx.service
    sudo sed --in-place "s/maintenance' => true/maintenance' => false/g" /var/www/localhost/htdocs/nextcloud/config/config.php
    sudo -u nginx php /var/www/localhost/htdocs/nextcloud/occ maintenance:mode --off

    _util_clear_old_backups ${_RC_NEXTCLOUD_BACKUPS_DIRECTORY}
    mc ${_RC_NEXTCLOUD_BACKUPS_DIRECTORY} "${_RC_NEXTCLOUD_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}"
  fi
}
