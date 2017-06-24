# grav
Docker implementation of [grav-admin](https://getgrav.org) using [debian:stretch](https://hub.docker.com/_/debian/)

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

This will deploy a default installation of grav-admin at [http://localhost](http://localhost).

On initial deploy the user will be redirected to [http://localhost/admin](http://localhost/admin) to register the Admin User.
![Grav Register Admin User](https://user-images.githubusercontent.com/5332509/27509308-a20baf8a-58c7-11e7-8371-d1d6c6edd0a4.png)
