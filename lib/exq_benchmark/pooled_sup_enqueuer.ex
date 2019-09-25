defmodule ExqBenchmark.PooledSupEnqueuer do
  def start_link(_) do
    name = :"#{__MODULE__}#{System.unique_integer([:positive])}"
    Exq.Enqueuer.start_link(name: name)
  end
end
