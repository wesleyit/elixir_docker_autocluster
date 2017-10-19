# AutoCluster

This is a simple application which uses Docker and Elixir to explore the Erlang VM cluster capabilities.

## Installation

I will assume you already have Docker, Docker Compose and Git installed, and your Linux user is a member of the `docker` group, being able to execute docker commands without `sudo`, ok?

```
git clone https://github.com/wesleyit/elixir_docker_autocluster.git
cd elixir_docker_autocluster
mix compose full
```

This will download the official Elixir container, build the application image and start 5 containers. To check out the containers output:

``` 
mix logs
```