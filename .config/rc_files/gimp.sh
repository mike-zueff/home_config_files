function _rc_gimp_clean_up
{
  rm --force --recursive ~/.cache/gegl-0.3 ~/.config/GIMP \
      ~/.local/share/gegl-0.3

  find ~ -iname "*gegl*" -or -iname "*gimp*" ! -path "${HOME}/.cargo/*" ! \
      -path "${HOME}/.config/rc_files/*" ! -path "${HOME}/.vim/*"
}
