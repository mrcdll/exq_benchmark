defmodule ExqBenchmark.MixProject do
  use Mix.Project

  def project do
    [
      app: :exq_benchmark,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExqBenchmark.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, "~> 1.0"},
      {:redix, ">= 0.0.0"},
      {:jason, "~> 1.1"},
      {:poolboy, "~> 1.5.1"},
      {:exq, "~> 0.13.3"},
      {:gproc, "~> 0.8.0"},
      {:benchee_html, "~> 1.0"},
      {:benchee_markdown, "~> 0.1"}
    ]
  end
end
