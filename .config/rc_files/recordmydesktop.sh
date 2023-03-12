function _rc_recordmydesktop
{
  _RC_REC_COMMAND=""
  _RC_REC_DATE=$(date +%Y_%m_%d_%H_%M_%S)
  _RC_REC_HEIGHT=1200
  _RC_REC_SCREEN=${1}
  _RC_REC_Y="-y 1080"

  [[ ${1} == "" ]] && _RC_REC_SCREEN=1

  if [[ ${_RC_REC_SCREEN} == "1" ]]
  then
    echo PRIMARY SCREEN.
  else
    _RC_REC_HEIGHT=1080
    _RC_REC_Y=""

    echo SECONDARY SCREEN.
  fi

  _RC_REC_COMMAND="recordmydesktop --height ${_RC_REC_HEIGHT} --no-cursor --no-frame --width 1920 ${_RC_REC_Y} --workdir ~/.cache/cache_recordmydesktop -o /zfs/rec_recordmydesktop/${_RC_REC_DATE}.ogv"
  echo "${_RC_REC_COMMAND}"
  eval "${_RC_REC_COMMAND}"
}
