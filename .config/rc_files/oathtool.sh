function _rc_oathtool
{
  oathtool --base32 --totp "${1}"
}
