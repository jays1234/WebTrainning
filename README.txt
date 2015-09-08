mvn clean compile -Dmaven.test.skip=true -Djetty.port=8083 jetty:run

mvn clean compile -Dmaven.test.skip=true -Dmaven.tomcat.port=8083 tomcat:run

sudo service oracle-xe start