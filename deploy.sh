jar cf test-RotsyFramework.war *

TOMCAT_PATH=/opt/apache-tomcat-10.1.28/webapps

CLASSPATH=$TOMCAT_PATH:./test-RotsyFramework.war

echo "deploying to " $CLASSPATH
cp test-RotsyFramework.war $TOMCAT_PATH
echo "Deployed to $TOMCAT_PATH"