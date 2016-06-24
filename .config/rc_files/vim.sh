function _rc_vim_reinstall
{
  rm --force --recursive ~/.cache/ctrlp ~/.cache/jedi ~/.cargo ~/.npm \
      ~/.pylint.d ~/.vim ~/.viminfo ~/.viminfo.tmp ~/.viminfz.tmp ~/.vimtags
  vim
}
