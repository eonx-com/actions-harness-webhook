#!/usr/bin/env bash

set -x

# Get parameters from the workflow
ACCOUNT_ID=${1}
WEBHOOK_ID=${2}
APPLICATION_ID=${3}
BUILD_NUMBER=${4}
PARAMETERS=${5}

if [[ -z "${PARAMETERS}" ]]; then
  # No parameter array supplied
  curl -X POST \
      -H "content-type: application/json" \
      --url "https://app.harness.io/gateway/api/webhooks/${WEBHOOK_ID}?accountId=${ACCOUNT_ID}" \
      -d "{\"application\":\"${APPLICATION_ID}\",\"artifacts\":[{\"service\":\"vpc\",\"buildNumber\":\"${BUILD_NUMBER}\"}]}"
else
  # Parameter array supplied
  curl -X POST \
      -H "content-type: application/json" \
      --url "https://app.harness.io/gateway/api/webhooks/${WEBHOOK_ID}?accountId=${ACCOUNT_ID}" \
      -d "{\"application\":\"${APPLICATION_ID}\",\"parameters\":${PARAMETERS},\"artifacts\":[{\"service\":\"vpc\",\"buildNumber\":\"${BUILD_NUMBER}\"}]}"
fi

