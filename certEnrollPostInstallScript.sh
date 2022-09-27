#!/bin/bash

echo "This script will copy the intermeidate CA truststore that you will need to distribute to your users from your Docker Container to your local server."
read -p "Press any key to being..."

#Make our changes live
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



