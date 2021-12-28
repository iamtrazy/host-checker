# host-checker
* This is a simple shell script which can be used to test bulk SNIs using a xray server
# requirements
* httping xray-core and jq should be preinstalled 
* script should be on the same place with your xray config.json file 
* xray config.json file should contain a serverName value and allowInsecure should be set to true
* hostfile should be on the same directory and shold contain all the hosts separated by a newline
# Usage
* clone or download the script
* give executable permission to the script
./script hostfile.text
* after checking all the hosts look for the log.txt to find working hosts
  * eg: grep "Working" log.txt
* remeber to clear the log file before re running the script else all hosts will append to the same log file
# to-be-added
* support for vmess with http host value
