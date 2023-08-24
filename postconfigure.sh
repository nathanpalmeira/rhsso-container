echo "Executing script" >> /tmp/test
$JBOSS_HOME/bin/jboss-cli.sh --file=/opt/eap/extensions/generic.cli
echo "Finishing script execution" >> /tmp/test