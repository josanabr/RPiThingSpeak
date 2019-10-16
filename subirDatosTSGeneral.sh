#!/usr/bin/env bash
#
# Este script sube dos datos constantes a un canal de ThingSpeak.
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Date: 2019-10-16
#

apiKey="<YOURWRITEKEY>"

temp1=5
temp2=10

update=$(curl --silent --request POST --header "X-THINGSPEAKAPIKEY: $apiKey" --data "field1=$temp1&field2=$temp2" "http://api.thingspeak.com/update")

if [ ${update} -eq 0 ]; then
  echo "[subirDatosTS] Error al subir datos"
  exit -1
else
  exit 0
fi
