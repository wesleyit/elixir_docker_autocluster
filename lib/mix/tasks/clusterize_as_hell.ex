defmodule Mix.Tasks.ClusterizeAsHell do
    use Mix.Task
  
    def run(_) do
      IO.puts("Hello, stranger! The app is up and running.")
      KeepDoing.start_link()
      IO.puts(inspect(AutoCluster.run()))
      Process.sleep(:infinity)
      IO.puts("Bye :D")
    end
end
  