function _rc_vpn_pq_ssh_connect_default
{
  _rc_vpn_pq_ssh_connect_ipv4
}

function _rc_vpn_pq_ssh_connect_ipv4
{
  . ~/.config/rc_files/credentials.sh
  sshpass -p"$_RC_PQ_VPN_PASSWORD" ssh root@"$_RC_PQ_VPN_IPV4"
}

function _rc_vpn_pq_ssh_connect_ipv6
{
  . ~/.config/rc_files/credentials.sh
  sshpass -p"$_RC_PQ_VPN_PASSWORD" ssh root@"$_RC_PQ_VPN_IPV6"
}
