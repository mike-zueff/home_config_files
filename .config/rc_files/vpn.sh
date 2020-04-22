function _rc_vpn_ssh_connect_default
{
  _rc_vpn_ssh_connect_v4
}

function _rc_vpn_ssh_connect_v4
{
  . ~/.config/rc_files/credentials.sh
  ssh -i ~/Nextcloud/nosync/rig/keys/id_rsa root@"$_RC_TMP_VPN_IPV4"
}

function _rc_vpn_ssh_connect_v6
{
  . ~/.config/rc_files/credentials.sh
  ssh -i ~/Nextcloud/nosync/rig/keys/id_rsa root@"$_RC_TMP_VPN_IPV6"
}
