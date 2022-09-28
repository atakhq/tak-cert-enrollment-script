# TAK Server Certificate Enrollment
## This script package will assist in setup of Certificate Enrollment on your TAK Server Docker Instance in just a few minutes.
### More info Here: https://atakhq.com/en/tak-server/cert-enrollment

1. Login as TAK Superuser and clone this repo to your machine

`su - tak`

`cd /tmp/ && git clone https://github.com/atakhq/tak-cert-enrollment-script.git && sudo chmod -R +x * /tmp/tak-cert-enrollment-script/`


2. Open a shell for your Docker container running TAK Server

`docker exec -it tak-server-tak-1 /bin/bash`


2. Clone this project into the docker container

`cd /tmp/ && git clone https://github.com/atakhq/tak-cert-enrollment-script.git`


3. Make the script executable and run it (we are inside the docker container)

`cd /tmp/tak-cert-enrollment-script/ && chmod +x * && ./certEnrollSetupScript.sh`


When prompted to move files around, answer 'y'

`Do you want me to move files around so that future server and client certificates are signed by this new CA? [y/n]`

Follow the prompts during the install to finish up.



## User Creation

Generate a new user in TAK Admin interface so they have a user/pass: https://111.222.333.444:8446/user-management/index.html#!/

Password must have at least 15 characters and must include 1 lowercase, 1 uppercase, 1 number and 1 special character.



## Connecting with Certificate Enrollment in ATAK

Copy truststore-intermediate-CA.p12 to your device.

Settings > Network Preferences> Server Connections > 3 vertical dots button in top right > Add 

**Name:** Whatever you want your server nickname to be in ATAK

**Address:** IP Address to your TAK server

**Use Authentication:** Checked

**Username:** Enter username

**Password:** Enter password

**Enroll for Client Certificate:** Checked

**Advanced Options:** Checked

**Use Default SSL/TLS Certificates:** UNchecked

**Import Trust Store:** Click and import truststore-intermediate-CA.p12 (password 'atakatak')

**Import Client Certificate:** Leave Blank


Click OK and you should see a message that you are registering with the server, if successful you should now be connected and certificates automagically loaded in your server profile in ATAK.


## Connecting with Certificate Enrollment in ITAK
ITAK does not support cert enrollment as of right now, must use datapackage zip file. 
