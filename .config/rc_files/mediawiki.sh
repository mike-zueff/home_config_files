function _rc_mediawiki_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_MEDIAWIKI_BACKUPS_DIRECTORY="/private/backups/mediawiki"

  [[ `sudo whoami` != "root" ]] && return 1

  if [[ ! -d ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    . ~/.config/rc_files/mediawiki_credentials.sh
    mysqldump --default-character-set=binary --host=localhost --password=${_RC_MEDIAWIKI_PASSWORD} --user=wiki-user --xml amalgam | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/amalgam.xml.xz
    mysqldump --default-character-set=binary --host=localhost --password=${_RC_MEDIAWIKI_PASSWORD} --user=wiki-user amalgam | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/amalgam.sql.xz
    php /var/www/localhost/htdocs/mediawiki/maintenance/dumpBackup.php --full --include-files --logs --uploads | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mediawiki_dump.xml.xz
    sudo tar --create --directory /var/www/localhost/htdocs mediawiki | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mediawiki_srv.tar.xz

    [[ `ls ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY} | wc --lines` -gt 20 ]] && find ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY} -maxdepth 1 -mindepth 1 -mtime +100 -exec rm --force --recursive "{}" \+

    mc ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY} ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}
