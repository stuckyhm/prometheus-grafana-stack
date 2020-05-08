<script src="https://cdnjs.cloudflare.com/ajax/libs/mermaid/8.5.0/mermaid.min.js"></script>
<link rel="stylesheet" href="./mermaid.css">
<script>mermaid.initialize({startOnLoad:true});</script>

# prometheus-grafana-stack
```mermaid
graph TD
Z(your Browser) -- :3000 --> A(Prometheus)
A[Grafana] -- :9090 --> B[Prometheus]
A --> C(other Datasources)
B -- :9091 --> D[Pushgateway]
B --> E(your Exporter)
B --> F(your Exporter)
G(your App) -- :9091 --> D
H(your App) -- :9091 --> D
style A fill:#cfdfff,stroke:#333,stroke-width:2px
style B fill:#cfdfff,stroke:#333,stroke-width:2px
style D fill:#cfdfff,stroke:#333,stroke-width:2px
```
## Start
```
docker-compose up
```

## Grafana
Grafana: [http://127.0.0.1:3000](http://127.0.0.1:3000)
Default-User/Passwort: admin/password

More Infos:
https://github.com/grafana/grafana
## Prometheus
Prometheus: [http://127.0.0.1:9090](http://127.0.0.1:9090)

More Infos:
https://github.com/prometheus/prometheus
## Prometheus Pushgateway
Pushgateway: [http://127.0.0.1:9091](http://127.0.0.1:9091)

Push a simple metric:
```
echo "some_metric 3.14" | curl --data-binary @- http://127.0.0.1:9091/metrics/job/some_job
```
More Infos:
https://github.com/prometheus/pushgateway

