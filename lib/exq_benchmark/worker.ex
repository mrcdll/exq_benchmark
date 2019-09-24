defmodule ExqBenchmark.Worker do
  require Logger

  def perform do
    Logger.info("Poolboy")
  end
end
