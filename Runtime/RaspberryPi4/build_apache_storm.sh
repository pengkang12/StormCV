# download zookeeper
wget  https://archive.apache.org/dist/zookeeper/zookeeper-3.6.4/apache-zookeeper-3.6.4-bin.tar.gz
tar zxvf apache-zookeeper-3.6.4-bin
mv apache-zookeeper-3.6.4-bin zookeeper

# start zookeeper

cp zookeeper/conf/zoo_sample.cfg zookeeper/conf/zoo.cfg
zookeeper/bin/zkServer.sh start

# download apache storm 0.9.6

wget https://archive.apache.org/dist/storm/apache-storm-0.9.6/apache-storm-0.9.6.tar.gz
tar zxvf apache-storm-0.9.6.tar.gz
mv apache-storm-0.9.6 storm

cd storm
# configure conf/storm.yaml
add the following content and change ip to your ip
```
storm.zookeeper.servers:
    - "192.168.1.24"
storm.local.dir: "/home/cc/storm/data"
ui.port: 9090
nimbus.seeds: ["192.168.1.24"]
nimbus.thrift.port: 6667
supervisor.slots.ports:
    - 6700
    - 6701
    - 6702
    - 6703
    - 6704
    - 6705
    - 6706
```

# start storm
```
bin/storm nimbus &
bin/storm ui &
bin/storm supervisor &
```

# install StormCV

git clone https://github.com/pengkang12/StormCV.git
sudo apt install maven

# Run StormCV application
bash StormCV/run.sh
