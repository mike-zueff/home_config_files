_rc_whois_grep()
{
  whois "$1" | grep --ignore-case "cidr\|inetnum\|inet6num"
}
