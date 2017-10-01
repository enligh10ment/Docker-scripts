#!/bin/bash

MYHOSTNAME=$(hostname)

if [[ "${MYHOSTNAME}" =~ "MAC1984" ]]; then
  BPATH="/Users/kaddyman/git/site-ops/scripts/docker/"
else
  BPATH="/home/cars/sre-tools/scripts/docker/"
fi

echo -e "\nSyncing .bashrc across all DOCKER servers...\n"

# PROD DOCKER App sync cs1dcl101-104
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ${BPATH}bashrc kaddyman@cs1dcl101.cars.com:/home/kaddyman/.bashrc
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ${BPATH}bashrc kaddyman@cs1dcl102.cars.com:/home/kaddyman/.bashrc
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ${BPATH}bashrc kaddyman@cs1dcl103.cars.com:/home/kaddyman/.bashrc
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q ${BPATH}bashrc kaddyman@cs1dcl104.cars.com:/home/kaddyman/.bashrc
echo -e "PROD DOCKER APP Server sync done\n"

