# p5etcdenv
perl script to pull environment variables from etcd and calling scripts e.g. tomcat startup. Expects an input key directory with key=values.

# Set directory
etcdctl mkdir /fabric/cmsportal/environment

# Push key/value
echo -n '-Xms4g -Xmx4g -XX:MaxPermSize=396M' | etcdctl set /fabric/cmsportal/environment/CATALINA_OPTS 

# Example  Read/Print Mode
p5etcdenv.pl /fabric/cmsportal/environment

# Example Startup Mode
p5etcdenv.pl /fabric/cmsportal/environment /etc/init.d/tomcat start
  


