defmodule Livecounter.Application do
  @moduledoc false
  use Application

@impl true
  def start(_type, _args) do
    children = [
      LivecounterWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:livecounter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Livecounter.PubSub},
      LivecounterWeb.Endpoint,
      LivecounterWeb.CounterState
    ]

    opts = [strategy: :one_for_one, name: Livecounter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    LivecounterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
