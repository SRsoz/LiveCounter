defmodule Livecounter.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LivecounterWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:livecounter, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Livecounter.PubSub},
      # Start a worker by calling: Livecounter.Worker.start_link(arg)
      # {Livecounter.Worker, arg},
      # Start to serve requests, typically the last entry
      LivecounterWeb.Endpoint,
      Livecounter.Counter
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Livecounter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LivecounterWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
