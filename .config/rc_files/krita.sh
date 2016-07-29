function _rc_krita_clean_up
{
  rm --force --recursive ~/.kde4/share/apps/krita ~/.kde4/share/config/kritarc

  find ~ -iname "*krita*" -not -path "${HOME}/.config/rc_files/*" -not -path \
      "${HOME}/.vim/*"
}
