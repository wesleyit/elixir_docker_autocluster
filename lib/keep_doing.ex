defmodule KeepDoing do
    use GenServer
    
    def start_link do
      GenServer.start_link(__MODULE__, %{})
    end
    
    def init(state) do
      schedule_work()
      {:ok, state}
    end
    
    def handle_info(:work, state) do
      IO.puts("Running on node #{inspect Node.self}\n" <>
              "All known nodes: #{inspect Node.list :known}\n" <>
              "------------------------------------------------------------")
      schedule_work()
      {:noreply, state}
    end
    
    defp schedule_work() do
      Process.send_after(self(), :work, 3000)
    end
end