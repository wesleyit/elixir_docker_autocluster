defmodule AutoCluster do

  ## Get information about the network
  defp get_inet(), do: elem(:inet.getif(), 1)

  ## Get a list with IPs and Masks and generate IPs in the range
  defp get_ip_list([]), do: []
  defp get_ip_list([h|t]) do 
      {{ip1,ip2,ip3,_ip4}, _bcast, {_m1,m2,m3,m4}} = h
      ips = cond do
          m2 < 255 -> for x <- 0..255, y <- 0..255, z <- 1..254, ip1 != 127, do: Enum.join([ip1, x, y, z], ".")
          m3 < 255 -> for y <- 0..255, z <- 1..254, ip1 != 127, do: Enum.join([ip1, ip2, y, z], ".")
          m4 < 255 -> for z <- 1..254, ip1 != 127, do: Enum.join([ip1, ip2, ip3, z], ".")
      end
      [ips | get_ip_list(t)]
  end

  ## Finnaly, connect them all, motherfuckers!!!
  defp ping_one(ip) do 
    IO.puts("Connecting to #{ip}")
    IO.inspect(Node.connect(String.to_atom("runner@" <> ip)))
  end

  defp ping_them_all(ips) do
      ips |>
      Enum.map(&(ping_one(&1)))
      ## FIXME - There are some problems happening here
      #Enum.map(&(Task.async(fn -> ping_one(&1) end))) |>
      #Enum.map(&Task.await/1, 30000)
  end

  ## The pipeline
  def run() do 
      get_inet() |> 
      get_ip_list() |> 
      List.flatten() |>
      ping_them_all()
  end

end
