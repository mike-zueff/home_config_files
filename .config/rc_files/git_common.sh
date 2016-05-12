function _rc_git_clean_repository_up
{
  rm --force --recursive .git/refs/original
  git reflog expire --all --expire=all
  git gc --prune=all
  git gc --aggressive --prune=all

  git remote prune upstream
  rm --force --recursive .git/logs

  echo git push origin --all --force
  echo git push origin --force --tags
}

function _rc_git_pull_origin
{
  git pull --all
  git pull origin master
}

function _rc_git_show_all_information
{
  git branch
  echo
  git count-objects --human-readable --verbose
  echo
  git remote show origin upstream
  echo
  git status
}
