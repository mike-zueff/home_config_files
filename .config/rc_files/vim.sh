function _rc_vim_reinstall
{
  chmod --recursive 777 ~/.vim 
  rm --force --recursive ~/.cache/ctrlp ~/.cache/go-build ~/.cache/jedi \
      ~/.mono ~/.pylint.d ~/.vim ~/.viminfo ~/.viminfo.tmp ~/.viminfz.tmp \
      ~/.vimtags ~/go
  vim
}
