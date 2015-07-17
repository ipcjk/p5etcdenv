# p5etcdenv
perl script to pull environment variables from etcd and calling scripts e.g. tomcat startup. Expects an input key directory with key=values.

etcdctl mkdir /fabric/cmsportal
echo -n '-Xms4g -Xmx4g -XX:MaxPermSize=396M' | etcdctl set /fabric/cmsportal/CATALINA_OPTS 

# Example  Read Mode
etcdenv.pl /fabric/cmsportal/environment
CATALINA_OPTS="-Xms4g -Xmx4g -XX:MaxPermSize=396M"
JAVA_HOME="/usr/java/jdk1.7.0_55"

# Example Startup Mode
etcdenv.pl /fabric/cmsportal/environment /etc/init.d/tomcat start
  


