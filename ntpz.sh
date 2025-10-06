#!/bin/bash
#ntpqz til source(s) stabilize
clear; NTPZ="$(ntpq -np)"; printf "$(date)\n\n"; echo "${NTPZ}"; while [[ "$(echo "${NTPZ}"|grep ^*)" == "" ]]; do printf "\033[0H"; printf "$(date)\n\n"; echo "${NTPZ}"; echo "still self-synching.."; sleep 1; NTPZ="$(ntpq -np)"; printf "\033[0H"; printf "$(date)\n\n"; echo "${NTPZ}"; done; printf "self-synch succeeded..\n\n"; ./0000
#printf "at the sound of the tone, the time-date is:\n\n$(date)\n$(TZ="America/New_York" date)\n"|festival --tts; printf "\n*tone*\n"; printf "\a\a";
