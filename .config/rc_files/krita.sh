function _rc_krita_clean_up
{
  rm --force --recursive ~/.config/kritarc ~/.local/share/krita

  find ~ -iname "*krita*" -not -path "${HOME}/.config/rc_files/*" -not -path \
      "${HOME}/.vim/*"
}
