#!/bin/bash

cd /home/elixir/elixir_docker_autocluster
export ip="$(grep $(hostname) /etc/hosts | cut -f 1)"
echo "Starting the local node..."
mkfifo /tmp/elixir
iex --name "runner@$ip" --cookie cookie \
    -S mix clusterize_as_hell 1> /tmp/elixir 2> /tmp/elixir &
echo "Done!"
cat /tmp/elixir
