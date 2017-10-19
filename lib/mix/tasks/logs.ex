defmodule Mix.Tasks.Logs do
  use Mix.Task

  def run(_) do
    Mix.shell.cmd("clear
    echo 'Type <ctrl>+<c> to exit'
    sleep 3
    cd docker
    docker-compose logs -f")
  end

end
