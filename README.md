# docker-vouch-proxy

A Docker image that builds [vouch-proxy](https://github.com/vouch/vouch-proxy) from source.

## Build instructions

Build the docker image locally:

```
cd docker-vouch-proxy
docker build -t vouch-proxy .
```

## Configuring vouch-proxy

Documentation for configuring vouch-proxy, along with example configs is available on the project's [GitHub page](https://github.com/vouch/vouch-proxy).

Create your own `config.yml` file based on your requirements using the documentation linked above. We will be exposing this to the container in a volume in the next step.

## Running the container

Create and run the container:

```
docker run -v ./config:/app/config --name vouch-proxy vouch-proxy
```

## Notes

Each time the image is built from scratch, vouch-proxy's main branch is cloned from GitHub. If you want to use a particular branch or tag, the Dockerfile can be updated accordingly.
