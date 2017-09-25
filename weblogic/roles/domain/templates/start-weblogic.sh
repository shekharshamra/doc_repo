!#/bin/bash
echo "starting weblogic server"
#start NodeManager"
cd /u02/opt/weblogic/wlserver/server/bin
nohup ./startNodeManager.sh &

sleep 60
echo "start weblogic server"
cd /u02/opt/weblogic/domains/smsdev/bin
nohup ./startWebLogic.sh &
