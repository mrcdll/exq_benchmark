defmodule EnqueuerServer do
  use GenServer

  def start_link(name: name) do
    GenServer.start_link(__MODULE__, [name], name: name)
  end

  def init([name]) do
    Exq.Enqueuer.start_link(name: name)
    :gproc_pool.add_worker(:gproc_pool, name)
    :gproc_pool.connect_worker(:gproc_pool, name)
    pid = Process.whereis(:"#{name}.Enqueuer")

    {:ok, %{pid: pid}}
  end

  def enqueue(pid) do
    GenServer.call(pid, :enqueue)
  end

  def handle_call(:enqueue, _from, state) do
    {:reply, Exq.enqueue(state.pid, "benchmark_queue", Worker, []), state}
  end
end
