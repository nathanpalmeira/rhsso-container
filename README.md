# RHSSO-CONTAINER

## Building

```
podman build -t rhsso-container:7.6.0 .
```

## Run

```
podman run -it -p 8081:8080 --name rhsso_container -e SSO_ADMIN_USERNAME=admin -e SSO_ADMIN_PASSWORD=admin rhsso-container:7.6.0
```

SSO_ADMIN_USERNAME and SSO_ADMIN_PASSWORD = painel rhsso username/password

## Docker compose

```
podman-compose up -d
```

