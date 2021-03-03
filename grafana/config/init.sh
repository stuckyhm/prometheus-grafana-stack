#!/bin/bash

BASE_URL=https://grafana.com/api
TARGET_DIR=/etc/grafana/provisioning/dashboards
PREFIX=autoinstall

function downloadDashboard() {
	ID=$1

	URL=$(wget -O - ${BASE_URL}/dashboards/${ID}/revisions 2>/dev/null | grep "revisions/[0-9]*\"" | tail -n 1 | cut -d '"' -f 4)
	NAME=$(wget -O - ${BASE_URL}/${URL} | grep dashboardSlug | tail -n 1 | cut -d '"' -f 4)

	wget -O ${TARGET_DIR}/${PREFIX}-${ID}-${NAME}.json ${BASE_URL}/${URL}/download
}

rm ${TARGET_DIR}/${PREFIX}-*
for ID in $(echo "${GF_INSTALL_DASHBOARDS}"  | tr ',' ' '); do
	echo "Downloading Dashboard ${ID} for provisioning"
	downloadDashboard ${ID}
done

find ${TARGET_DIR} -name "${PREFIX}-*" -print -exec sed -i'' s/\$custom_label_name/job/g {} \;
find ${TARGET_DIR} -name "${PREFIX}-*" -print -exec sed -i'' s/\${DS_PROMETHEUS}/\prometheus/g {} \;

/run.sh
