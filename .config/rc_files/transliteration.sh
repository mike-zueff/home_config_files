function _rc_transliterate_ru_to_en
{
  local CURRENT_CHARACTER=""
  local I=0
  local J=0
  local RESULT=""
  local TABLE_EN=()
  local TABLE_EN_L=()
  local TABLE_RU=()
  local TABLE_RU_L=()

  TABLE_RU_L+=(а); TABLE_EN_L+=(a)
  TABLE_RU_L+=(б); TABLE_EN_L+=(b)
  TABLE_RU_L+=(в); TABLE_EN_L+=(v)
  TABLE_RU_L+=(г); TABLE_EN_L+=(g)
  TABLE_RU_L+=(д); TABLE_EN_L+=(d)
  TABLE_RU_L+=(е); TABLE_EN_L+=(e)
  TABLE_RU_L+=(ё); TABLE_EN_L+=(e)
  TABLE_RU_L+=(ж); TABLE_EN_L+=(zh)
  TABLE_RU_L+=(з); TABLE_EN_L+=(z)
  TABLE_RU_L+=(и); TABLE_EN_L+=(i)
  TABLE_RU_L+=(й); TABLE_EN_L+=(i)
  TABLE_RU_L+=(к); TABLE_EN_L+=(k)
  TABLE_RU_L+=(л); TABLE_EN_L+=(l)
  TABLE_RU_L+=(м); TABLE_EN_L+=(m)
  TABLE_RU_L+=(н); TABLE_EN_L+=(n)
  TABLE_RU_L+=(о); TABLE_EN_L+=(o)
  TABLE_RU_L+=(п); TABLE_EN_L+=(p)
  TABLE_RU_L+=(р); TABLE_EN_L+=(r)
  TABLE_RU_L+=(с); TABLE_EN_L+=(s)
  TABLE_RU_L+=(т); TABLE_EN_L+=(t)
  TABLE_RU_L+=(у); TABLE_EN_L+=(u)
  TABLE_RU_L+=(ф); TABLE_EN_L+=(f)
  TABLE_RU_L+=(х); TABLE_EN_L+=(kh)
  TABLE_RU_L+=(ц); TABLE_EN_L+=(ts)
  TABLE_RU_L+=(ч); TABLE_EN_L+=(ch)
  TABLE_RU_L+=(ш); TABLE_EN_L+=(sh)
  TABLE_RU_L+=(щ); TABLE_EN_L+=(shch)
  TABLE_RU_L+=(ъ); TABLE_EN_L+=(ie)
  TABLE_RU_L+=(ы); TABLE_EN_L+=(y)
  TABLE_RU_L+=(ь); TABLE_EN_L+=("")
  TABLE_RU_L+=(э); TABLE_EN_L+=(e)
  TABLE_RU_L+=(ю); TABLE_EN_L+=(iu)
  TABLE_RU_L+=(я); TABLE_EN_L+=(ia)

  for (( I = 0; I < ${#TABLE_RU_L[@]}; ++I ))
  do
    TABLE_EN+=("${TABLE_EN_L[${I}]}")
    TABLE_EN+=("${TABLE_EN_L[${I}]^}")
    TABLE_RU+=("${TABLE_RU_L[${I}]}")
    TABLE_RU+=("${TABLE_RU_L[${I}]^}")
  done

  for (( I = 0; I < ${#1}; ++I ))
  do
    CURRENT_CHARACTER=${1:${I}:1}

    for (( J = 0; J < ${#TABLE_RU[@]}; ++J ))
    do
      if [[ ${TABLE_RU[${J}]} == "${CURRENT_CHARACTER}" ]]
      then
        CURRENT_CHARACTER=${TABLE_EN[${J}]}
        break
      fi
    done

    RESULT+=$CURRENT_CHARACTER
  done

  echo "${RESULT}"
}
