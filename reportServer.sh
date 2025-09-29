cd /ss-ui-automation/cypress/
ubpDate=$(date +"%Y-%m-%dT%H-%M-%S")
#gpName=gp-reports
ssVariable=$ssDate
zipFolder=$ssVariable.zip
zip -r $zipFolder reports
scp -o StrictHostKeyChecking=no -i /ss-ui-automation/reportServer.pem $zipFolder centos@10.91.10.124:/home/centos/SS
scp -o StrictHostKeyChecking=no -i /ss-ui-automation/reportServer.pem test.done centos@10.91.10.124:/home/centos/SS
echo "Report will be available in this link after 30 min. Please visit the link for details and go to date wise folder: "
echo "http://10.91.10.124:8888/ss/$ssDate/index.html"
