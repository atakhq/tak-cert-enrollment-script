#!/bin/bash

echo "This script will copy the intermediate CA truststore that you will need to distribute to your users from your Docker Container to your local server."
read -p "Press any key to being..."

#Make our changes live
cd ~/tak-server/
docker-compose down
service docker restart
docker-compose up -d

CONTAINER_NAME=$(sudo docker container ls | awk 'NR==2{print substr($2,1,length($2))}')

if [ $CONTAINER_NAME != "tak-server-tak" ]; then 
    echo "UNABLE TO FIND TAK DOCKER CONTAINER!"
    exit
else 
    CONTAINER_ID=$(sudo docker container ls | awk 'NR==2{print substr($1,1,length($2))}')
fi

sudo mkdir ~/tak-server/certs
sudo docker cp $CONTAINER_ID:/opt/tak/certs/files/truststore-intermediate-CA.p12 ~/tak-server/certs
sudo chmod 777 ~/tak-server/certs/*

while true; do
echo "Are you working with a server install or local install?"
echo "A: Server Install"
echo "B: Local Install"
echo ""
read transferoption
        case $transferoption in
                [Aa]* )
                        echo "*****************************************"
                        echo "Using Server Install Method"
                        echo "*****************************************"
                        echo "***************************************************"
                        echo "***************************************************"
                        echo "File copied successfully, please run the following command on your LOCAL machine to download the common cert."
                        echo "(replace 111.222.333.444 with your server IP)"
                        echo ""
                        echo "scp tak@111.222.333.444:~/tak-server/certs/truststore-intermediate-CA.p12 ~/atak/certs"
                        echo ""
                        echo "***************************************************"
                        echo "***************************************************"
                        break
                ;;
                [Bb]* )
                        echo "*****************************************"
                        echo "Using Local Install Method"
                        echo "*****************************************"
                        echo "***************************************************"
                        echo "***************************************************"
                        cd ~/tak-server/certs/
                        ls
                        echo "File copied successfully!"
                        echo "You are in the folder with your common cert file '~/tak-server/certs/' which as been listed above."
                        echo "***************************************************"
                        echo "***************************************************"
                        break
                ;;
                * ) echo "You must select a valid option to continue";;
        esac
done

echo "****************************"
echo "******** WARNING ***********"
echo "****************************"
echo "It can take a very long time for the TAK service to come back online after reboot (5min or so)."
echo " "
ehco "You can check the status of the startup by tailing the logs like so:"
echo "docker exec -it tak-server_tak_1 /bin/bash"
echo "tail -f /opt/tak/logs/takserver.log"
echo " "
echo "You want to wait for the 'Waiting for the API process...' to stop and show the plugin service has started before you try to login to the admin web UI. Example below:"
printf "2022-09-27-19:49:53.476 [main] t.s.plugins.service.PluginService - Waiting for the API process...\n
2022-09-27-19:49:54.477 [main] t.s.plugins.service.PluginService - Waiting for the API process...\n
2022-09-27-19:49:55.478 [main] t.s.plugins.service.PluginService - Waiting for the API process...\n
2022-09-27-19:49:56.482 [main] t.s.plugins.service.PluginService - Waiting for the API process...\n
2022-09-27-19:49:57.484 [main] t.s.plugins.service.PluginService - Waiting for the API process...\n
2022-09-27-19:49:58.485 [main] t.s.plugins.service.PluginService - Waiting for the API process...\n
2022-09-27-19:50:00.128 [main] t.s.plugins.service.PluginService - pluginMissionApi available: true\n
2022-09-27-19:50:01.209 [main] com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Starting...\n
2022-09-27-19:50:01.272 [main] com.zaxxer.hikari.HikariDataSource - HikariPool-1 - Start completed.\n
2022-09-27-19:50:01.306 [main] t.s.ignite.IgniteConfigurationHolder - ignite configuration not populated yet\n
2022-09-27-19:50:01.425 [main] t.s.p.messaging.PluginMessenger - create PluginMessenger\n
2022-09-27-19:50:04.669 [main] t.s.p.manager.loader.PluginLoader - starting PluginLoader\n
2022-09-27-19:50:04.855 [main] t.s.p.messaging.PluginMessenger - starting PluginMessenger\n
2022-09-27-19:50:04.887 [main] t.s.plugins.service.PluginService - Started PluginService in 166.325 seconds (JVM running for 208.108)\n
"
