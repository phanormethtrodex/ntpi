#!/bin/bash
#ntp sync-on-boot
set -ex;
#trash;
#if [[ $(uptime -p|sed -r 's/^up\ ([0-9]*)\ [a-z]*/\1/') -lt 30 ]]; then echo "new boot..check if ntp needs to synch..";
  if [[ "$(grep nist /etc/ntp.conf|grep -o ^#)" != "" ]];
  then
    echo "ntp unsyched..";
    grep nist /etc/ntp.conf;
    date;
    echo "ntp reconfig..";
    sudo sed -i '/nist/s/^#//' /etc/ntp.conf;
    grep nist /etc/ntp.conf;
    sudo service ntp restart;
    while [[ "$(ntpq -np|grep NIST|grep ^*)" == "" ]];
    do
      date; sleep 1;
    done;
    date;
    echo "ntp has resynch..";
    date;
    sudo sed -i '/nist/s/^/#/' /etc/ntp.conf;
    echo "ntp deconfig..";
    grep nist /etc/ntp.conf;
    sudo service ntp restart;
  fi;
#else
#  echo "ntp was synchd..";
#fi
