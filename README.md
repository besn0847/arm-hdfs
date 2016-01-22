# arm-hdfs

To start the container with default config :
```bash
docker run -d -P arm-hdfs
```

But you can also use your local datastore :
```bash
docker run -d -P -v <your local datastore>:/data arm-hdfs
```

Please note that the startup process takes some time to ensure the namenode is properly started before starting the datanode.
Once started just point your browser to http://localhost:26412/explorer/
