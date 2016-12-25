wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x ./jq
mv jq /tmp/jq



zk=$(curl -s -u admin:Password@123 -G https://hbase-base.azurehdinsight.net/api/v1/clusters/hbase-base/services/ZOOKEEPER/components/ZOOKEEPER_SERVER | /tmp/jq '[.host_components[].HostRoles.host_name]|join(", ")')

#wget hbase-config from git to the servers
wget -O /tmp/hbase-site.xml -q https://raw.githubusercontent.com/afrozahmad/azurepoc/master/hbase-spark/template/hbase-site.xml


rm -f /etc/hbase/conf/hbase-site.xml
sed "s/__zookeeper__/$zk/g" < /tmp/hbase-site.xml > /etc/hbase/conf/hbase-site.xml

