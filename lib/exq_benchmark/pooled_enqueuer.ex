defmodule ExqBenchmark.PooledEnqueuer do
  def start_link(_) do
    name = :"#{__MODULE__}#{System.unique_integer([:positive])}"
    Exq.Enqueuer.start_link(name: name)

    # We need to put the enqueuer instance into the pool
    {:ok, Process.whereis(:"#{name}.Enqueuer")}
  end
end
