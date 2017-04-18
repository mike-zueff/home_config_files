_rc_password_generate()
{
  if [[ ${1} =~ ^[1-9][0-9]*$ && ${1} -le 95 ]]
  then
    local ELEMENTS I PASSWORD

    for I in $(seq 1 "${1}")
    do
      if [[ ${I} -eq 1 || ${I} -eq ${1} ]]
      then
        local REGEX=graph
      else
        local REGEX=print
      fi

      while true
      do
        local CHARACTER
        CHARACTER=$(dd bs=1 count=1 if=/dev/urandom status=none | tr \
            --complement --delete [:${REGEX}:])

        if [[ ${#CHARACTER} -eq 1 ]]
        then
          local IS_IN_ARRAY=0 J

          for J in "${ELEMENTS[@]}"
          do
            if [[ ${J} == "${CHARACTER}" ]]
            then
              IS_IN_ARRAY=1
              break
            fi
          done

          if [[ ${IS_IN_ARRAY} -eq 0 ]]
          then
            ELEMENTS+=(${CHARACTER})
            break
          fi
        fi
      done

      PASSWORD=${PASSWORD}${CHARACTER}
    done

    echo "${PASSWORD}"
  else
    echo Password length should be in the range from 1 to 95 inclusive.
  fi
}
