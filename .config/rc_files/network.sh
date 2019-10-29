function _rc_fix_network
{
  [[ `sudo whoami` != "root" ]] && return 1

  echo Flushing IPv6 addresses...
  sleep 2
  sudo ip -6 address flush enp4s0
  echo Disabling NIC...
  sleep 2
  sudo ifconfig enp4s0 down
  sleep 2
  echo Enabling NIC...
  sudo ifconfig enp4s0 up
  sleep 2
  echo Restarting services...
  sudo systemctl restart systemd-networkd.service systemd-resolved.service
  sleep 2
  echo Done.
  sudo ifconfig
}
