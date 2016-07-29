function _rc_gimp_clean_up
{
  rm --force --recursive ~/.cache/gegl-0.3 ~/.config/GIMP \
      ~/.local/share/gegl-0.3

  find ~ -iname "*gegl*" -or -iname "*gimp*" -not -path \
      "${HOME}/.config/rc_files/*" -not -path "${HOME}/.vim/*"
}
