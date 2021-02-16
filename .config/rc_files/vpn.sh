function _rc_vpn_ssh_connect_default
{
  _rc_vpn_ssh_connect_ipv4
}

function _rc_vpn_ssh_connect_ipv4
{
  . ~/.config/rc_files/credentials.sh
  ssh -i /private/keys/scaleway/id_rsa root@"$_RC_TMP_VPN_IPV4"
}

function _rc_vpn_ssh_connect_ipv6
{
  . ~/.config/rc_files/credentials.sh
  ssh -i /private/keys/scaleway/id_rsa root@"$_RC_TMP_VPN_IPV6"
}
