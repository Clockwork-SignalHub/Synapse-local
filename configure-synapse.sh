#!/bin/bash
set -e
mkdir -p synapse_data
chmod -R 777 synapse_data
docker run --rm -v "$(pwd)/synapse_data:/data" --user "$(id -u):$(id -g)" \
  -e SYNAPSE_SERVER_NAME=localhost \
  -e SYNAPSE_REPORT_STATS=no \
  matrixdotorg/synapse:latest generate
sed -i '' '/^database:/,/^[^ ]/d' synapse_data/homeserver.yaml
echo -e "\ndatabase:\n  name: psycopg2\n  args:\n    user: synapse_user\n    password: signal123\n    database: synapse\n    host: db\n    cp_min: 5\n    cp_max: 10\n" >> synapse_data/homeserver.yaml
sed -i '' 's/#public_baseurl: .*/public_baseurl: http:\/\/localhost/g' synapse_data/homeserver.yaml
sed -i '' 's/#enable_registration: false/enable_registration: true/g' synapse_data/homeserver.yaml
sed -i '' 's/#enable_registration_without_verification: false/enable_registration_without_verification: true/g' synapse_data/homeserver.yaml
echo "Synapse config generated and updated in synapse_data/homeserver.yaml"
