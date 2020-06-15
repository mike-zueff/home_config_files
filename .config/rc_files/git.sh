function _rc_git_pull_upstream
{
  git pull --all --no-rebase
  git pull --no-rebase upstream master
}
