
# Logs-collector demo stack

Demo how to collect, centralize and route logs into both an [Elasticsearch index](https://www.elastic.co/fr/products/elasticsearch)  and an [Influxdb database](https://github.com/influxdata/influxdb), using [Fluentd](https://www.fluentd.org/).


### How to run locally ?

- Run the logs-collector stack

```
docker-compose up -d --build
```

- Run the stresser script

```
./stresser/run.sh
```

- Or/And curl the apache server to generate access logs

```
curl http://localhost/
```

- Then take a look at your logs...

... in fluentd container stdout

```
docker logs -f logscollector_fluentd_1
```

... in elasticsearch index (through kibana)

[http://localhost:5601](http://localhost:5601)

... in influxdb (through chronograf)

[http://localhost:5601](http://localhost:8888)


### Useful links

- https://docs.fluentd.org/v1.0/articles/out_elasticsearch
- https://github.com/fangli/fluent-plugin-influxdb
- https://docs.fluentd.org/v0.12/articles/routing-examples
- https://docs.docker.com/config/containers/logging/log_tags/
