defmodule ElixirDockerAutoclusterTest do
  use ExUnit.Case
  doctest ElixirDockerAutocluster

  test "greets the world" do
    assert ElixirDockerAutocluster.hello() == :world
  end
end
