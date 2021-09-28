#!/bin/sh
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
info starting init consul container
info get consul snapshot now
consul snapshot save{{ if .Values.consul.CONSUL_DATACENTER }} -datacenter=${CONSUL_DATACENTER}{{ end }} \
  /data/consul-backup-$(date +"%H-%M-%S").tgz
info snapshotting done