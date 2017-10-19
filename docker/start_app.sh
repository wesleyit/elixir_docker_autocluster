#!/bin/bash

cd /home/elixir/
export ip="$(grep $(hostname) /etc/hosts | cut -f 1)"
echo "Starting the local node..."
mkfifo /tmp/elixir
elixir --name "runner@$ip" --cookie cookie app.exs 1> /tmp/elixir 2> /tmp/elixir &
echo "Done!"

cat /tmp/elixir