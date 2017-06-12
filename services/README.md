# Examples

These are minimal rudimantary examples of services communicating over HTTP. One service (frontend) needs to discover the other one (backend) and does it via Docker and Consul DNS mechanisms respectively, depending on which endpoint is called. Frontend also exposes a `/www` endpoint to demonstrate that external DNS names can also be resolved. These are deployed using the `services` role above and included in `consul-client.yml`
