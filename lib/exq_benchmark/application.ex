defmodule ExqBenchmark.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children =
      [
        {Redix, name: :redix},
        :poolboy.child_spec(:worker, poolboy_config()),
        ExqBenchmark.GprocEnqueuer
      ] ++ named_enqueuer_pool(enqueuer_pool_size())

    opts = [strategy: :one_for_one, name: ExqBenchmark.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp named_enqueuer_pool(count) do
    for i <- 0..(count - 1) do
      name = :"Elixir.Exq#{i}"

      %{
        id: name,
        start: {Exq.Enqueuer, :start_link, [[name: name]]}
      }
    end
  end

  def enqueuer_pool_size(), do: :erlang.system_info(:schedulers_online)

  def poolboy_config() do
    [
      {:name, {:local, :enqueuer}},
      {:worker_module, ExqBenchmark.PooledEnqueuer},
      {:size, enqueuer_pool_size()}
    ]
  end
end
