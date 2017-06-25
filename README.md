# grav
Docker implementation of [grav-admin](https://getgrav.org) using [debian:stretch](https://hub.docker.com/_/debian/)

**WORK IN PROGRESS**:

- [x] Basic implementation in Docker
- [x] Extend pages directories to local volume mount
- [x] Allow UID/GID setting within container for host user permissions on mounted volumes
- [ ] SSL integration - self generated certs / LetsEncrypt hooks
- [ ] Nginx reverse proxy

## Supported tags and respective Dockerfile links

- 1.3.0-rc.4, latest ([1.3.0-rc.4/Dockerfile](https://github.com/mjstealey/grav/blob/master/1.3.0-rc.4/Dockerfile))

### Pull image from dockerhub

```bash
docker pull mjstealey/grav-admin:latest
```

### Usage:

**Example 1.** Deploy with default configuration

```bash
docker run --name grav -p 80:80 mjstealey/grav-admin:latest
```
- **NOTE**: Generally the `-d` flag would be used in the above call to daemonize the process

The running site can be found at [http://localhost](http://localhost).

- On first use the user will be redirected to [http://localhost/admin](http://localhost/admin) to register an Admin User for the installation.
![Grav Register Admin User](https://user-images.githubusercontent.com/5332509/27509308-a20baf8a-58c7-11e7-8371-d1d6c6edd0a4.png)
