# tak-cert-enrollment
This script package will assit in setup of Certificate Enrollment on your TAK Server Docker Instance.

1. Open a shell for your Docker container running TAK Server

`docker exec -it tak-server-tak-1 /bin/bash`



2. Clone this project

`cd tmp && git clone https://github.com/atakhq/tak-cert-enrollment-script.git`

3. Make the script executable and run it

`cd /tmp/tak-cert-enrollment-script/ && chmod +x * && ./certEnrollSetupScript.sh`
