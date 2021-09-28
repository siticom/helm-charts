#!/bin/sh
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
info starting restic container
if restic{{ if not .Values.restic.cache.enabled }} --no-cache{{ end }} snapshots; then
  echo "restic repository exists"
else
  echo "restic repository init"
  restic{{ if not .Values.restic.cache.enabled }} --no-cache{{ end }} init
fi
info backup now
restic --verbose{{ if .Values.restic.cache.enabled }} --cleanup-cache{{ end }}{{ if not .Values.restic.cache.enabled }} --no-cache{{ end }} backup /data
info backup is done prune now
restic{{ if not .Values.restic.cache.enabled }} --no-cache{{ end }} forget --group-by tag --prune --keep-hourly ${RESTIC_RETENTION_HOURLY} --keep-daily ${RESTIC_RETENTION_DAILY} --keep-weekly ${RESTIC_RETENTION_WEEKLY} --keep-monthly ${RESTIC_RETENTION_MONTHLY} &&
info prune is done