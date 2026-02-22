_rc_password_generate()
{
  local length="$1"

  if [[ -z "$length" ]]; then
    length=32
  fi

  if [[ -z "$length" || "$length" -lt 4 ]]; then
    echo "Usage: _rc_password_generate <length>=4+" >&2
    return 1
  fi

  local upper='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  local lower='abcdefghijklmnopqrstuvwxyz'
  local digits='0123456789'
  local special='@%_=+:,.'
  local all="$upper$lower$digits$special"

  local password=(
    "$(env LC_ALL=C printf '%s' "$upper"   | fold -w1 | shuf | head -n1)"
    "$(env LC_ALL=C printf '%s' "$lower"   | fold -w1 | shuf | head -n1)"
    "$(env LC_ALL=C printf '%s' "$digits"  | fold -w1 | shuf | head -n1)"
    "$(env LC_ALL=C printf '%s' "$special" | fold -w1 | shuf | head -n1)"
  )

  local remaining=$((length - 4))
  if (( remaining > 0 )); then
    password+=(
      "$(env LC_ALL=C tr -dc "$all" </dev/urandom | head -c "$remaining" | fold -w1)"
    )
  fi

  env LC_ALL=C printf '%s\n' "${password[@]}" | shuf | tr -d '\n'
  echo
}

_rc_tmp_not_needed_password_generate()
{
  local LENGTH

  LENGTH=${1}
  [[ ${1} == "" ]] && LENGTH=63

  if [[ ${LENGTH} =~ ^[1-9][0-9]*$ && ${LENGTH} -le 63 ]]
  then
    local ELEMENTS I PASSWORD

    for I in $(seq 1 "${LENGTH}")
    do
      while true
      do
        local CHARACTER
        CHARACTER="$(dd bs=1 count=1 if=/dev/urandom status=none | tr \
          --complement --delete '[:alnum:]_')"

        if [[ ${#CHARACTER} -eq 1 ]]
        then
          local IS_IN_ARRAY=0 J

          for J in "${ELEMENTS[@]}"
          do
            if [[ "${J}" == "${CHARACTER}" ]]
            then
              IS_IN_ARRAY=1
              break
            fi
          done

          if [[ ${IS_IN_ARRAY} -eq 0 ]]
          then
            ELEMENTS+=("${CHARACTER}")
            break
          fi
        fi
      done

      PASSWORD="${PASSWORD}${CHARACTER}"
    done

    echo "${PASSWORD}"
  else
    echo Password length should be in the range from 1 to 63 inclusive.
  fi
}
