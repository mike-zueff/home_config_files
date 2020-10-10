function _rc_tor_refresh
{
  if [[ `whoami` == 'root' ]]
  then
    killall -HUP tor
  else
    sudo killall -HUP tor
  fi
}
