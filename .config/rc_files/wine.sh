function _rc_wine_clean_up
{
  rm --force --recursive ~/.cache/winetricks ~/.wine

  find ~ -iname "*wine*" -not -path "${HOME}/.cargo/*" -not -path \
      "${HOME}/.config/rc_files/*" -not -path "${HOME}/.local/share/icons/*" \
      -not -path "${HOME}/.local/share/mime/*" -not -path "${HOME}/.vim/*"
}
