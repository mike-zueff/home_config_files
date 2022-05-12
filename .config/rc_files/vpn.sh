function _rc_vpn_gcorelabs_ssh_connect_default
{
  _rc_vpn_gcorelabs_ssh_connect_ipv4
}

function _rc_vpn_gcorelabs_ssh_connect_ipv4
{
  . ~/.config/rc_files/credentials.sh
  sshpass -p"$_RC_TMP_GCORELABS_PASSWORD" ssh root@"$_RC_TMP_GCORELABS_VPN_IPV4"
}

function _rc_vpn_gcorelabs_ssh_connect_ipv6
{
  . ~/.config/rc_files/credentials.sh
  sshpass -p"$_RC_TMP_GCORELABS_PASSWORD" ssh root@"$_RC_TMP_GCORELABS_VPN_IPV6"
}

function _rc_vpn_scaleway_ssh_connect_default
{
  _rc_vpn_scaleway_ssh_connect_ipv4
}

function _rc_vpn_scaleway_ssh_connect_ipv4
{
  . ~/.config/rc_files/credentials.sh
  ssh -i /private/keys/scaleway/id_rsa root@"$_RC_TMP_SCALEWAY_VPN_IPV4"
}

function _rc_vpn_scaleway_ssh_connect_ipv6
{
  . ~/.config/rc_files/credentials.sh
  ssh -i /private/keys/scaleway/id_rsa root@"$_RC_TMP_SCALEWAY_VPN_IPV6"
}
