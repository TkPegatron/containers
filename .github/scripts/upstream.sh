#!/usr/bin/env bash

APP="${1}"
CHANNEL="${2}"

if test -f "./containers/${APP}/ci/latest.sh"; then
    bash ./containers/"${APP}"/ci/latest.sh "${CHANNEL}"
fi
