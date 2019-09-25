defmodule ExqBenchmark.Enqueuer do
  alias ExqBenchmark.Worker

  def poolboy_enqueue() do
    :poolboy.transaction(:enqueuer, fn pid ->
      Exq.enqueue(pid, "benchmark_queue", Worker, [])
    end)
  end

  def poolboy_sup_enqueue() do
    :poolboy.transaction(
      :sup_enqueuer,
      fn pid ->
        enqueue_server = get_enqueuer_server(pid)

        Exq.Enqueuer.enqueue(enqueue_server, "benchmark_queue", Worker, [])
      end
    )
  end

  def gproc_enqueue() do
    ExqBenchmark.GprocEnqueuer.enqueue()
  end

  def named_enqueue() do
    num = :rand.uniform(ExqBenchmark.Application.enqueuer_pool_size()) - 1
    Exq.enqueue(:"Elixir.Exq#{num}.Enqueuer", "benchmark_queue", Worker, [])
  end

  def get_enqueuer_server(supervisor_pid) do
    [{_, pid, _, _}] =
      Supervisor.which_children(supervisor_pid)
      |> Enum.filter(fn {module, _, _, _} -> module == Exq.Enqueuer.Server end)

    pid
  end
end
