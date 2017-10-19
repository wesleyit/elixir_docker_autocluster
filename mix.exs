defmodule AutoCluster.Mixfile do
  use Mix.Project

  def project do
    [
      app: :autocluster,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  def run do
    IO.puts("Hello, stranger! The app is up and running.")
    KeepDoing.start_link()
    IO.puts(inspect(AutoCluster.run()))
    Process.sleep(:infinity)
    IO.puts("Bye :D")
  end

  def compose do
    Mix.shell.cmd("cd docker; docker-compose down; docker compose up --build")
  end
end


