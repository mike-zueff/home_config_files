function _util_clear_old_backups
{
  if echo "${1}" | grep --quiet '^/private/backups/.'
  then
    CURRENT_YEAR=$(date +%Y)
    PREVIOUS_YEAR=$((CURRENT_YEAR - 1))

    find "${1}" -maxdepth 1 -mindepth 1 ! -type d -exec rm --force --recursive {} +
    find "${1}" -maxdepth 1 -mindepth 1 ! -regex "^${1}/${CURRENT_YEAR}.*" ! -regex "^${1}/${PREVIOUS_YEAR}.*" -exec rm --force --recursive {} +
  fi
}
