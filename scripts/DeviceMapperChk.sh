#!/usr/bin/env bash

#IFS=$'\n'
exec 2>/dev/null
MYHOSTNAME=$(hostname)

function getDeviceMapper() {
  local sshuser=$1
  declare -a sshhosts=($2)
  #echo "${sshuser}"
  #echo "${sshhosts[@]}"
  for sshhost in ${sshhosts[@]}; do
    # 8[0-9]%|9[0-9]%|100%
    #echo "${sshuser}@${sshhost}"

    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=5 -q ${sshuser}@${sshhost} devicemapperget >> ${LOGFILE}
    echo >> ${LOGFILE}
    # ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=5 -q ${sshuser}@${sshhost} diskuse | egrep "8[0-9]%|9[0-9]%|100%" | sed "s/^/${sshhost} /g" | tee -a ${LOGFILE}
  done
}

# On-Prem Non-Swarm Docker
declare -a DEV_DOCKER_HOSTS=(host1 host2)
declare -a IT_DOCKER_HOSTS=(host1 host2 host3 host3)
declare -a PT_DOCKER_HOSTS=(host1 host2 host3 host4)
declare -a PROD_DOCKER_HOSTS=(host1 host2 host3 host4)

LOGFILE=$(mktemp)
echo "HOST,USED,TOTAL,AVAILABLE," >> ${LOGFILE}
echo >> ${LOGFILE}

# On-Prem Non-Swarm Docker
getDeviceMapper kaddyman "$(echo ${DEV_DOCKER_HOSTS[@]})"
getDeviceMapper kaddyman "$(echo ${IT_DOCKER_HOSTS[@]})"
getDeviceMapper kaddyman "$(echo ${PT_DOCKER_HOSTS[@]})"
getDeviceMapper kaddyman "$(echo ${PROD_DOCKER_HOSTS[@]})"

clear

IFS=$'\n'
(for line in $(cat ${LOGFILE}); do
  echo "${line}"  
done) | column -t -s','

rm ${LOGFILE}
