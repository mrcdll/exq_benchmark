defmodule ExqBenchmark.GprocEnqueuer do
  def child_spec(_args) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []}
    }
  end

  def start_link() do
    :gproc_pool.new(:gproc_pool)

    Enum.each(1..5, fn _ ->
      name = name()

      Exq.Enqueuer.start_link(name: name)
      :gproc_pool.add_worker(:gproc_pool, name)
      :gproc_pool.connect_worker(:gproc_pool, name)
    end)

    {:ok, self()}
  end

  def enqueue() do
    {_, _, [_, _, _, worker_name]} = :gproc_pool.pick(:gproc_pool)
    pid = Process.whereis(:"#{worker_name}.Enqueuer")
    Exq.enqueue(pid, "benchmark_queue", Worker, [])
  end

  defp name do
    :"#{__MODULE__}#{System.unique_integer([:positive])}"
  end
end
