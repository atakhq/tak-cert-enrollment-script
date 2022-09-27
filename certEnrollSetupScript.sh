#!/bin/bash

echo "YOU MUST RUN THIS FROM INSIDE YOUR TAK DOCKER CONTAINER!!!!"
read -p "Press any key to being setup..."


#Make the int cert and edit the tak config to use it
cd /opt/tak/certs/
./makeCert.sh ca intermediate-CA

#Add new conx type
sed -i '5 a\        <input _name="cassl" auth="x509" protocol="tls" port="8089" />' /opt/tak/CoreConfig.xml

#Remove old CA config
sed -i '65d' /opt/tak/CoreConfig.xml

#Add new CA Config
sed -i '65 a\            <TAKServerCAConfig keystore="JKS" keystoreFile="/opt/tak/certs/files/intermediate-CA-signing.jks" keystorePass="atakatak" validityDays="30" signatureAlg="SHA256WithRSA"/>' /opt/tak/CoreConfig.xml

#Remove old TLS config
sed -i '68d' /opt/tak/CoreConfig.xml

#Add new TLS Config
sed -i '68 a\        <tls keystore="JKS" keystoreFile="/opt/tak/certs/files/takserver.jks" keystorePass="atakatak" crlFile="/opt/tak/certs/files/intermediate-CA.crl" truststore="JKS" truststoreFile="/opt/tak/certs/files/truststore-intermediate-CA.jks" truststorePass="atakatak" context="TLSv1.2" keymanager="SunX509"/>' /opt/tak/CoreConfig.xml


echo ""
echo "***************************************************************************"
echo "***************************************************************************"
echo "Setup Complete: "
echo "Please exit the docker container and then run the post-install script." 
echo "exit"
echo "cd /tmp/tak-cert-enrollment-script/ && chmod +x * && . certEnrollPostInstallScript.sh"
echo ""
echo "***************************************************************************"
echo "***************************************************************************"

