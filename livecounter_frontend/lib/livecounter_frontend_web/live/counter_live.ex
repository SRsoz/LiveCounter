defmodule LivecounterFrontendWeb.CounterLive do
  use Phoenix.LiveView

  alias LivecounterFrontendWeb.BackendClient

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :refresh)
    end

    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def handle_info(:refresh, socket) do
    %{"count" => count} = BackendClient.get_counter()
    {:noreply, assign(socket, count: count)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div style="padding: 2rem; font-family: sans-serif">
      <h1>Live Counter</h1>
      <p>Current count: <strong><%= @count %></strong></p>
    </div>
    """
  end
end
