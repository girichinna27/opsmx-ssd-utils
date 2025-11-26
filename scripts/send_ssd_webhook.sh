#!/bin/bash
set -e

echo "Sending build event to SSD..."

curl --location "$SSD_URL/webhook/v1/ssd" \
  --header 'Content-Type: application/json' \
  --header "X-OpsMx-Auth: $SSD_TOKEN" \
  --data "{
    \"jobname\": \"${JOB_NAME}\",
    \"buildnumber\": \"${BUILD_NUMBER}\",
    \"joburl\": \"${JOB_URL}\",
    \"builduser\": \"ssdadmin@opsmx.io\",
    \"giturl\": \"${GIT_URL}\",
    \"gitbranch\": \"${BRANCH_NAME}\",
    \"artifacts\": [
      { \"image\": \"${IMAGENAME}\" }
    ]
  }"

echo "SSD Webhook sent successfully."
