function _rc_git_process_upstream
{
  git pull --all
  git pull upstream master
  echo
  git status
}
