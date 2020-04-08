

#!/bin/sh
echo "Hello Jyotirmoy, Sample Shell Script Exeuted successfully"
kill $(cat ./pid.file)
nohup java -jar /home/ec2-user/test/target/com.spring-boot.demo-0.0.1-SNAPSHOT.jar & echo $! > ./pid.file &
exit /b 0