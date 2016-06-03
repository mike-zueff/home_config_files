function _rc_vim_reinstall
{
  rm --force --recursive ~/.cache/ctrlp ~/.vim ~/.viminfo ~/.viminfo.tmp \
      ~/.viminfz.tmp ~/.vimtags
  vim
}
