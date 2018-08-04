function _rc_mediawiki_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_MEDIAWIKI_BACKUPS_DIRECTORY="/private/backups/mediawiki"

  [[ `sudo whoami` != "root" ]] && return 1

  if [[ ! -d ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    . ~/.config/rc_files/credentials.sh
    mysqldump --default-character-set=binary --host=localhost --password=${_RC_MEDIAWIKI_PASSWORD} --user=mediawiki --xml mediawiki | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mariadb.xml.xz
    mysqldump --default-character-set=binary --host=localhost --password=${_RC_MEDIAWIKI_PASSWORD} --user=mediawiki mediawiki | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mariadb.sql.xz
    php /var/www/localhost/htdocs/mediawiki/maintenance/dumpBackup.php --full --include-files --logs --uploads | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mediawiki.xml.xz
    sudo tar --create --directory /var/www/localhost/htdocs mediawiki | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mediawiki.tar.xz

    _util_clear_old_backups ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}

    mc ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY} ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}
