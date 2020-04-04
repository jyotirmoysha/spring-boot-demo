

#!/bin/sh
echo "Hello Jyotirmoy, Sample Shell Script Exeuted successfully"
kill $(cat ./pid.file)
echo "tomcat killed successfully"