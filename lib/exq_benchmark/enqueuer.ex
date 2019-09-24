defmodule ExqBenchmark.Enqueuer do
  alias ExqBenchmark.Worker

  def poolboy_enqueue() do
    :poolboy.transaction(:enqueuer, fn pid ->
      Exq.enqueue(pid, "benchmark_queue", Worker, [])
    end)
  end

  def gproc_enqueue() do
    ExqBenchmark.GprocEnqueuer.enqueue()
  end

  def named_enqueue() do
    num = :rand.uniform(ExqBenchmark.Application.enqueuer_pool_size()) - 1
    Exq.enqueue(:"Elixir.Exq#{num}.Enqueuer", "throughput_queue", Worker, [])
  end
end
