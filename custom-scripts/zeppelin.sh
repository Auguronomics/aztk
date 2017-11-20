if  [ "$IS_MASTER" = "1" ]; then

    ZEPPELIN_PORT=9995
    cd /

    wget http://apache.forsale.plus/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-netinst.tgz 
    gzip -d zeppelin-0.7.3-bin-netinst.tgz
    tar xvf zeppelin-0.7.3-bin-netinst.tar
    rm zeppelin-0.7.3-bin-netinst.tar
    mv zeppelin-0.7.3-bin-netinst zeppelin
    cd zeppelin
    ./bin/install-interpreter.sh --name md,shell,jdbc,python,livy
    ./bin/install-interpreter.sh --name spark --artifact org.apache.zeppelin:zeppelin-spark_2.11:0.7.3

    cat << EOF > ./conf/zeppelin-env.sh
    export ZEPPELIN_PORT=9995
EOF

    cat << EOF > ./conf/zeppelin-site.xml
<configuration>
    <property>
        <name>zeppelin.server.port</name>
        <value>9995</value>
        <description>Server port.</description>
    </property>
</configuration> 
EOF

    ./bin/zeppelin-daemon.sh upstart

 fi


