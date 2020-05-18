
# prometheus-grafana-stack
## What's included?
* [Prometheus](https://github.com/prometheus/prometheus) - collecting the metrics
* [Grafana](https://github.com/grafana/grafana) - visualisation of the metrics
* [node-exporter](https://github.com/prometheus/node_exporter) - provides host und some container metrics
* [cAdvisor](https://github.com/google/cadvisor) - provides container metrics
* [pushgateway](https://github.com/prometheus/pushgateway) - for things witch can't provide metrics themselves
* [prometheus-docker-sd](https://github.com/stuckyhm/prometheus-docker-sd) - automated service discovery for prometheus

![Diagram](/docs/diagram.png)
## How to use it? 
```
git clone git@github.com:stuckyhm/prometheus-grafana-stack.git
docker-compose up
```

### Metrics via Service Discovery
Add the following labels to your containers.
| label                            | mandatory | default          | description                                         |
| -------------------------------- | :-------: | ---------------- | --------------------------------------------------- |
| prometheus-scrape.enabled        |       yes |                  | Must set to "true" for enabled.                     |
| prometheus-scrape.job_name       |        no | <Container-Name> | Content for the prometheus label "job".             |
| prometheus-scrape.hostname       |        no | <Container-Name> | Hostname, if it differs from the container name or for access via the public interface.    |
| prometheus-scrape.ip_as_hostname |        no |            false | Use the container ip instead of the container name. |
| prometheus-scrape.port           |        no |             9090 | Port of the metrics endpoint.                       |
| prometheus-scrape.scheme         |        no |             http | Scheme http or https                                |
| prometheus-scrape.metrics_path   |        no |         /metrics | Path to the metrics endpoint.                       |

**Important: The Container has to be in the same network that prometheus. At the moment, the stack is connected to default network docker0 (bridge).**

### Metrics via pushdateway
Connect to your Instance: [http://127.0.0.1:9091](http://127.0.0.1:9091)

Push a simple metric:
```
echo "some_metric 3.14" | curl --data-binary @- http://127.0.0.1:9091/metrics/job/some_job
```

![Diagram](/docs/pushgateway.png)

More Samples at https://github.com/prometheus/pushgateway

**Important: The Container has to be in the same network that prometheus. At the moment, the stack is connected to default network docker0 (bridge).**

## Access the metrics
### Grafana
Connect to your Gradana instance: [http://127.0.0.1:3000](http://127.0.0.1:3000)

Default-User/Passwort: admin/password

![Diagram](/docs/grafana.png)

More Infos:
https://github.com/grafana/grafana
### Prometheus
Connect to your instance: [http://127.0.0.1:9090](http://127.0.0.1:9090)

![Diagram](/docs/prometheus.png)

More Infos:
https://github.com/prometheus/prometheus
