# How it run

```
docker run -v ${PWD}/config.json.example:/etc/kea-config.json -it kea-dhcp:latest kea-dhcp4 -c /etc/kea-config.json
```
