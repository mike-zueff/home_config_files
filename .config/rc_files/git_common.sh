function _rc_git_clean_repository_up
{
  git remote prune origin
  git remote prune upstream

  rm --force --recursive .git/refs/original
  git reflog expire --all --expire=all
  git gc --prune=all
  git gc --aggressive --prune=all

  rm --force --recursive .git/logs

  git push origin --all --force
  git push origin --force --tags
}

function _rc_git_pull_origin
{
  git pull --all --no-rebase
  git pull --no-rebase origin master
}

function _rc_git_show_all_information
{
  git branch | cat
  echo
  git count-objects --human-readable --verbose
  echo
  git remote show origin upstream
  echo
  git status
}
