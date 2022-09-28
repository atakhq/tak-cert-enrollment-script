# TAK Server Certificate Enrollment
## This script package will assist in setup of Certificate Enrollment on your TAK Server Docker Instance in just a few minutes.
### More info Here: https://atakhq.com/en/tak-server/cert-enrollment

1. Login as TAK Superuser and clone this repo to your machine

`su - tak`

`cd /tmp/ && git clone https://github.com/atakhq/tak-cert-enrollment-script.git && sudo chmod -R +x * /tmp/tak-cert-enrollment-script/`


2. Open a shell for your Docker container running TAK Server

`docker exec -it tak-server-tak-1 /bin/bash`


2. Clone this project into the docker container, make executable, run it

`cd /tmp/ && git clone https://github.com/atakhq/tak-cert-enrollment-script.git && cd /tmp/tak-cert-enrollment-script/ && chmod +x * && ./certEnrollSetupScript.sh`

When prompted to move files around, answer 'y'

`Do you want me to move files around so that future server and client certificates are signed by this new CA? [y/n]`

Follow the prompts during the install to finish up.

#### Post Setup Warning: 
**The server takes a long time to come back up and be reachable in your browser, especially if you are on a machine with little ram (RPI/BPI). Be patient and tail the server logs as suggested at the end of the install script. If it seems to hang at one part for an excessive amount of time, try to hit your server login page on port 8446 and I find this "wakes up" tak and it resumes the startup process.**

**Once you see** 

`2022-09-27-20:44:07.184 [main] t.s.plugins.service.PluginService - Started PluginService in 198.462 seconds (JVM running for 253.01)`

**the service should be up and reachable.**


**Here is an example of the log file leading up to the point where the server becomes reachable:**
```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v2.7.1)

2022-09-27-20:40:53.402 [main] t.s.plugins.service.PluginService - Starting PluginService using Java 11.0.16 on d6a98f8b998f with PID 11 (/opt/tak/takserver-pm.jar started by root in /opt/tak)
2022-09-27-20:40:53.423 [main] t.s.plugins.service.PluginService - No active profile set, falling back to 1 default profile: "default"
2022-09-27-20:43:28.097 [main] t.s.plugins.service.PluginService - pluginDataFeedApi available: true
2022-09-27-20:43:28.309 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:29.311 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:30.312 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:31.318 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:32.319 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:33.321 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:34.322 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:35.324 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:36.324 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:37.325 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:38.326 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:39.330 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:40.334 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:41.335 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:42.337 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:43.338 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:44.343 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:45.344 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:46.346 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:47.347 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:48.348 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:49.354 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:50.357 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:51.360 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:52.361 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:53.362 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:54.365 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:55.366 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:56.367 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:57.368 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:58.369 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:43:59.375 [main] t.s.plugins.service.PluginService - Waiting for the API process...
2022-09-27-20:44:01.089 [main] t.s.plugins.service.PluginService - pluginMissionApi available: true
2022-09-27-20:44:02.423 [main] com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...
2022-09-27-20:44:02.584 [main] com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.
2022-09-27-20:44:02.657 [main] t.s.ignite.IgniteConfigurationHolder - ignite configuration not populated yet
2022-09-27-20:44:02.915 [main] t.s.p.messaging.PluginMessenger - create PluginMessenger
2022-09-27-20:44:06.734 [main] t.s.p.manager.loader.PluginLoader - starting PluginLoader
2022-09-27-20:44:07.122 [main] t.s.p.messaging.PluginMessenger - starting PluginMessenger
2022-09-27-20:44:07.184 [main] t.s.plugins.service.PluginService - Started PluginService in 198.462 seconds (JVM running for 253.01)

```


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
