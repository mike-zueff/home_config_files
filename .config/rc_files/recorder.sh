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

function _rc_record_1_headphones
{
  local _RC_TMP_DEVICE=""

  _RC_TMP_DEVICE=$(pw-cli ls | grep -B 100 -i alsa_output.pci-0000_07_00.0.analog-stereo | grep object.serial | tail -n 1 | sed 's/.*= //' | sed 's/"//g')
  pw-cat --record --target "$_RC_TMP_DEVICE" 1_headphones.wav
}

function _rc_record_2_microphone
{
  pw-cat --record 2_microphone.wav
}

function _rc_record_3_desktop
{
  ffmpeg -video_size 1920x1200 -framerate 25 -f x11grab -i :0.0+0,1080 -y 3_desktop.mp4
}

function _rc_record_merge_all_files
{
  ffmpeg -i 1_headphones.wav -i 2_microphone.wav -filter_complex "[0][1]amerge=inputs=2,pan=stereo|FL<c0+c2|FR<c1+c3[a]" -map "[a]" -b:a 320k -y 4_merged_audio.mp3
  ffmpeg -i 3_desktop.mp4 -i 4_merged_audio.mp3 -map 0:v -map 1:a -c copy -y 5_merged_video_and_audio.mp4
}
