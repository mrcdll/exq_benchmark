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

      EnqueuerServer.start_link(name: name)
    end)

    {:ok, self()}
  end

  def enqueue() do
    pid = :gproc_pool.pick_worker(:gproc_pool)
    EnqueuerServer.enqueue(pid)
  end

  defp name do
    :"#{__MODULE__}#{System.unique_integer([:positive])}"
  end
end
