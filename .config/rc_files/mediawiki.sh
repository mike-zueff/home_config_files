function _rc_mediawiki_back_up_house
{
  _util_mediawiki_back_up house
}

function _rc_mediawiki_back_up_kpi
{
  _util_mediawiki_back_up kpi
}

function _util_mediawiki_back_up
{
  _RC_CURRENT_DATE_STAMP=`date +%Y_%m_%d_%H_%M_%S`
  _RC_MEDIAWIKI_BACKUPS_DIRECTORY="/private/backups/${1}"

  [[ `sudo whoami` != "root" ]] && return 1

  if [[ ! -d ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} ]]
  then
    mkdir ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
    . ~/.config/rc_files/credentials.sh
    mariadb-dump --default-character-set=binary --host=localhost --password=${_RC_MEDIAWIKI_PASSWORD} --user=wiki --xml wiki_${1} | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mariadb.xml.xz
    mariadb-dump --default-character-set=binary --host=localhost --password=${_RC_MEDIAWIKI_PASSWORD} --user=wiki wiki_${1} | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/mariadb.sql.xz
    sudo php /var/www/localhost/htdocs/${1}/maintenance/dumpBackup.php --full --include-files --logs --uploads | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/wiki.xml.xz
    sudo tar --create --directory /var/www/localhost/htdocs ${1} | xz --best > ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}/wiki.tar.xz

    _util_clear_old_backups ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}

    mkdir --parents /mnt/luksextra1/xtr1/backups/${1}
    cp --force --recursive ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP} /mnt/luksextra1/xtr1/backups/${1}
    mc ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY} ${_RC_MEDIAWIKI_BACKUPS_DIRECTORY}/${_RC_CURRENT_DATE_STAMP}
  fi
}
