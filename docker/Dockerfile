FROM elixir:1.5.2
MAINTAINER Wesley Silva <wesley.it@gmail.com>

## We are not going to run the app as root, are we?
RUN groupadd elixir -g 1000 && \
		useradd -m elixir \
			-u 1000 -g 1000 \
			-s /bin/bash \
			-d /home/elixir
USER elixir
WORKDIR /home/elixir
ENV PATH="/home/elixir/.mix:${PATH}"

## Get the app
RUN git clone https://github.com/wesleyit/elixir_docker_autocluster.git
WORKDIR /home/elixir/elixir_docker_autocluster
RUN git checkout development

## Install rebar and hex
RUN mix local.hex --force && \
		mix local.rebar --force

## Start the main app
ENV TERM=vt100
CMD bash docker/start_app.sh
