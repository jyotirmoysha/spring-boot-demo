#!/bin/bash
url='http://18.220.83.189:8080/demo/hello'
attempts=5
timeout=5

echo "Checking status of URL:  $url ..............."

for (( i=1; i<=$attempts; i++ ))
do
  code=`curl -sL --connect-timeout 20 --max-time 30 -w "%{http_code}\\n" "$url" -o /dev/null`

  echo "Found code $code for $url."

  if [ "$code" = "200" ]; then
    echo "Website $url is online."
    break
  else
    echo "Website $url seems to be offline. Waiting $timeout seconds."
	echo "Congratulations.... YOUR APPLICATION IS UP AND RUNNING"
    sleep $timeout
  fi
done