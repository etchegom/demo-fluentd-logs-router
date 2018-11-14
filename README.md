
# Logs-collector demo stack

Demo how to collect, centralize and route logs into both an Elasticsearch index and an Influxdb database, using Fluentd.


### How to run locally ?

- Run the logs-collector stack

```
docker-compose up -d --build
```

- Run the stresser script

```
./stresser/run.sh
```

- Look at your logs...

... in fluentd container stdout

```
docker logs -f logscollector_fluentd_1
```

... in elasticsearch index (through kibana)

[http://localhost:5601](http://localhost:5601)

... in influxdb (through chronograf)

[http://localhost:5601](http://localhost:5601)
