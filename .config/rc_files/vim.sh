function _rc_vim_reinstall
{
  rm --force --recursive ~/.cache/ctrlp ~/.cache/go-build ~/.cache/jedi \
      ~/.mono ~/.npm ~/.pylint.d ~/.vim ~/.viminfo ~/.viminfo.tmp \
      ~/.viminfz.tmp ~/.vimtags ~/go
  vim
}
