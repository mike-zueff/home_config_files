function _rc_get_random_range
{
  shuf --head-count 1 --input-range "$1"-"$2"
}
