
# prometheus-grafana-stack
![Diagram](/docs/diagram.png)
## Start
```
docker-compose up
```

## Grafana
Connector your Instance: [http://127.0.0.1:3000](http://127.0.0.1:3000)

Default-User/Passwort: admin/password

More Infos:
https://github.com/grafana/grafana
## Prometheus
Connector your Instance: [http://127.0.0.1:9090](http://127.0.0.1:9090)

More Infos:
https://github.com/prometheus/prometheus
## Prometheus Pushgateway
Connector your Instance: [http://127.0.0.1:9091](http://127.0.0.1:9091)

Push a simple metric:
```
echo "some_metric 3.14" | curl --data-binary @- http://127.0.0.1:9091/metrics/job/some_job
```
More Infos:
https://github.com/prometheus/pushgateway

