#!/usr/bin/env bash

INTERVAL_NOTIFICATION_S=$(( 60 * 60 ))
INTERVAL_SLEEP_S=20
TIME_START_S=$(date +%s)

TIME_LAST_S=$(( TIME_START_S - TIME_START_S % INTERVAL_NOTIFICATION_S ))

while true
do
  TIME_CURRENT_S=$(date +%s)
  TIME_NEAREST_S=$(( TIME_LAST_S + INTERVAL_NOTIFICATION_S ))

  if [[ TIME_CURRENT_S -gt TIME_NEAREST_S ]]
  then
    TIME_LAST_S=$TIME_NEAREST_S

    INTERVAL_EXPIRATION_U=$(( (INTERVAL_NOTIFICATION_S + 2 * INTERVAL_SLEEP_S) * 1000 ))
    /usr/bin/notify-send --expire-time $INTERVAL_EXPIRATION_U --icon /usr/share/icons/Tango/scalable/apps/internet-web-browser.svg "<b>MediaWiki</b><br />Please visit the Private MediaWiki."
  fi

  sleep $INTERVAL_SLEEP_S
done
