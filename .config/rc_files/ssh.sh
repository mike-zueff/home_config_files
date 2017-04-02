function _rc_ssh_init
{
  if [[ -z ${SSH_AGENT_PID} ]]
  then
    eval "$(ssh-agent -s)"
    echo "${SSH_AGENT_PID}" > "/run/workshop/ssh/${USER}_pid"
    echo "${SSH_AUTH_SOCK}" > "/run/workshop/ssh/${USER}_socket"
    ssh-add
  fi
}

if [[ -f /run/workshop/ssh/${USER}_pid ]]
then
  SSH_AGENT_PID=$(cat "/run/workshop/ssh/${USER}_pid")
  SSH_AUTH_SOCK=$(cat "/run/workshop/ssh/${USER}_socket")
  export SSH_AGENT_PID
  export SSH_AUTH_SOCK
fi
