#!/bin/bash

echo "YOU MUST RUN THIS FROM INSIDE YOUR TAK DOCKER CONTAINER!!!!"
read -p "Press any key to being setup..."


#Make the int cert and edit the tak config to use it
cd /opt/tak/certs/
./makeCert.sh ca intermediate-CA

#Add new conx type
sed -i '4 a\         <input _name="cassl" auth="x509" protocol="tls" port="8089" />' /opt/tak/CoreConfig.xml

#Remove old CA config
sed -i -e '58,69d' /opt/tak/CoreConfig.xml

#Add new CA Config
sed -i '58 a\   <certificateSigning CA="TAKServer">\n     <certificateConfig>\n         <nameEntries>\n             <nameEntry name="O" value="TAK"/>\n             <nameEntry name="OU" value="TAK"/>\n         </nameEntries>\n     </certificateConfig>\n     <TAKServerCAConfig\n     keystore="JKS"\n     keystoreFile="/opt/tak/certs/files/intermediate-CA-signing.jks"\n     keystorePass="atakatak"\n     validityDays="30"\n     signatureAlg="SHA256WithRSA"/>\n    </certificateSigning>\n    <security>\n        <tls\n        keystore="JKS"\n        keystoreFile="/opt/tak/certs/files/takserver.jks"\n        keystorePass="atakatak"\n        crlFile="/opt/tak/certs/files/intermediate-CA.crl"\n        truststore="JKS"\n        truststoreFile="/opt/tak/certs/files/truststore-intermediate-CA.jks"\n        truststorePass="atakatak"\n        context="TLSv1.2"\n        keymanager="SunX509"/>\n    </security>' /opt/tak/CoreConfig.xml

echo ""
echo "Setup Complete: "
echo "Please exit the docker container and then run the post-install script." 
echo "exit"
echo "cd /tmp/tak-cert-enrollment-script/ && sudo ./certEnrollPostInstallScript.sh"

