sudo apt-get install jq


zk = $(curl -s -u admin:Password@123 -G https://hbase-base.azurehdinsight.net/api/v1/clusters/hbase-base/services/ZOOKEEPER/components/ZOOKEEPER_SERVER | jq '[.host_components[].HostRoles.host_name]|join(", ")')

#wget hbase-config from git to the servers
wget -O /tmp/hbase-config.xml -q https://hdiconfigactions.blob.core.windows.net/linuxconfigactionmodulev01/HDInsightUtilities-v01.sh



sed "/s/__zookeeper__/$zk/g" < /tmp/hbase-site.xml > /etc/hbase/conf/hbase-site.xml

