# Local Synapse Setup
1. Clone the repo.
2. Generate config files:
   ```bash
   mkdir -p synapse_data
   docker run --rm -v $(pwd)/synapse_data:/data -e SYNAPSE_SERVER_NAME=localhost -e SYNAPSE_REPORT_STATS=no matrixdotorg/synapse:latest generate
3. Edit synapse_data/homeserver.yaml:
   - Set database:
     name: psycopg2
     args:
       user: synapse_user
       password: signal123
       database: synapse
       host: db
       cp_min: 5
       cp_max: 10

   - Set public_baseurl: http://localhost
 
   - Set enable_registration: true and enable_registration_without_verification: true
4. Run `docker compose up -d`
5. Access via the Element broswer client using http://localhost as homeserver.
