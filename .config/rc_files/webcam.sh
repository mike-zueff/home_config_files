function _rc_webcam_check
{
  if lsmod | grep --ignore-case --quiet "uvcvideo"
  then
    [[ ${1} ]] || echo Warning! Your webcam is on!
    return 1
  else
    [[ ${1} ]] || echo All right. Your webcam is off.
  fi
}

function _rc_webcam_toggle
{
  [[ $(sudo whoami) != "root" ]] && return 1

  if _rc_webcam_check silent
  then
    echo Your webcam is off. Switching it on...
    sudo modprobe uvcvideo
    echo Done. Your webcam should be on from now on.
  else
    echo Your webcam is on. Switching it off...
    sudo modprobe --remove uvcvideo
    echo Done. Checking your webcam driver presence...

    if _rc_webcam_check silent
    then
      echo All right. Your webcam driver have been successfully removed.
    else
      echo Warning! Your webcam is still on for some reason!
    fi
  fi
}
