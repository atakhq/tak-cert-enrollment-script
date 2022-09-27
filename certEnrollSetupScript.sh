#!/bin/bash

echo "YOU MUST RUN THIS FROM INSIDE YOUR TAK DOCKER CONTAINER!!!!"
read -p "Press any key to being setup..."

#Make the int cert and edit the tak config to use it
cd /opt/tak/certs/
./makeCert.sh ca intermediate-CA

#Add new conx type
ed CoreConfig.xml
4i
        <input _name="cassl" auth="x509" protocol="tls" port="8089" />
.
w
q

#Remove old CA config
sed -i -e '58,69d' CoreConfig.xml

#Add new CA Config
ed CoreConfig.xml
58i
    <certificateSigning CA="TAKServer">
     <certificateConfig>
         <nameEntries>
             <nameEntry name="O" value="TAK"/>
             <nameEntry name="OU" value="TAK"/>
         </nameEntries>
     </certificateConfig>
     <TAKServerCAConfig
     keystore="JKS"
     keystoreFile="/opt/tak/certs/files/intermediate-CA-signing.jks"
     keystorePass="atakatak"
     validityDays="30"
     signatureAlg="SHA256WithRSA"/>
    </certificateSigning>
    <security>
        <tls
        keystore="JKS"
        keystoreFile="/opt/tak/certs/files/takserver.jks"
        keystorePass="atakatak"
        crlFile="/opt/tak/certs/files/intermediate-CA.crl"
        truststore="JKS"
        truststoreFile="/opt/tak/certs/files/truststore-intermediate-CA.jks"
        truststorePass="atakatak"
        context="TLSv1.2"
        keymanager="SunX509"/>
    </security>
.
w
q
