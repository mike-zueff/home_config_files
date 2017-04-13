function _util_clear_old_backups
{
  if echo "${1}" | grep --quiet '^/private/backups/.'
  then
    CURRENT_YEAR=$(date +%Y)
    PREVIOUS_YEAR=$((CURRENT_YEAR - 1))
    R=${1//+/\\+}

    find "${1}" -maxdepth 1 -mindepth 1 ! -type d -exec rm --force --recursive {} +
    find "${1}" -maxdepth 1 -mindepth 1 ! -regex "^${R}/${CURRENT_YEAR}.*" ! -regex "^${R}/${PREVIOUS_YEAR}.*" -exec rm --force --recursive {} +
  fi
}
