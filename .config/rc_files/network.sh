function _rc_fix_network
{
  [[ `sudo whoami` != "root" ]] && return 1

  echo Disabling NIC...
  sleep 5
  sudo ifconfig enp4s0 down
  sleep 5
  echo Enabling NIC...
  sudo ifconfig enp4s0 up
  sleep 5
  echo Restarting services...
  sudo systemctl restart systemd-networkd.service systemd-resolved.service
  sleep 5
  echo Done.
  sudo ifconfig
}
