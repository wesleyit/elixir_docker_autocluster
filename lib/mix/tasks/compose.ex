defmodule Mix.Tasks.Compose do
    use Mix.Task
  
    def run(_) do
      Mix.shell.cmd("cd docker;
      docker-compose down; 
      docker-compose build;
      docker-compose up -d;
      docker-compose scale app_node=5
      docker-compose logs")
    end

    def run(arg) do
      if arg == 'full' do
        Mix.shell.cmd("cd docker;
        docker-compose down; 
        docker-compose build --force-rm --no-cache --pull;
        docker-compose up -d 
        docker-compose scale app_node=5
        docker-compose logs")
      end
    end
end
