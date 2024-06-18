function _rc_obsolete_parecord
{
  _RC_REC_DATE=$(date +%Y_%m_%d_%H_%M_%S)

  _rc_obsolete_pipewire_reset
  _rc_obsolete_pipewire_prepare
  parecord --device desktop-record-virtual-microphone-1 "/zfs/rec_sound/${_RC_REC_DATE}.wav"
}

function _rc_obsolete_pipewire_prepare
{
  pactl load-module module-null-sink \
    channel_map=stereo \
    media.class=Audio/Sink \
    sink_name=desktop-record-combined-sink-1

  pactl load-module module-null-sink \
    channel_map=front-left,front-right \
    media.class=Audio/Source/Virtual \
    sink_name=desktop-record-virtual-microphone-1

  pw-link alsa_output.pci-0000_07_00.0.analog-stereo:monitor_FL desktop-record-combined-sink-1:playback_FL
  pw-link alsa_output.pci-0000_07_00.0.analog-stereo:monitor_FR desktop-record-combined-sink-1:playback_FR

  pw-link alsa_input.pci-0000_00_1b.0.analog-stereo:capture_FL desktop-record-combined-sink-1:playback_FL
  pw-link alsa_input.pci-0000_00_1b.0.analog-stereo:capture_FR desktop-record-combined-sink-1:playback_FR

  pw-link desktop-record-combined-sink-1:monitor_FL desktop-record-virtual-microphone-1:input_FL
  pw-link desktop-record-combined-sink-1:monitor_FR desktop-record-virtual-microphone-1:input_FR
}

function _rc_obsolete_pipewire_reset
{
  pactl unload-module module-null-sink
}

function _rc_obsolete_recordmydesktop
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
