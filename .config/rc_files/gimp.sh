function _rc_gimp_clean_up
{
  rm --force --recursive ~/.cache/babl ~/.cache/gegl-0.4 ~/.cache/gimp \
      ~/.config/GIMP ~/.local/share/gegl-0.4

  find ~ \( -iname "*babl*" -or -iname "*gegl*" -or -iname "*gimp*" \) ! -path \
      "${HOME}/.cargo/*" ! -path "${HOME}/.config/rc_files/*" ! -path \
      "${HOME}/.vim/*" ! -path "${HOME}/Nextcloud/*"
}
