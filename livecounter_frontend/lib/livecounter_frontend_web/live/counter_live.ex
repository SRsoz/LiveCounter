defmodule LivecounterFrontendWeb.CounterLive do
  use LivecounterFrontendWeb, :live_view

  alias LivecounterFrontendWeb.BackendClient

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      # Skicka refresh varje sekund
      :timer.send_interval(1000, self(), :refresh)
    end

    {:ok, assign(socket, count: 0)}
  end

  @impl true
  def handle_info(:refresh, socket) do
    # Hämta count från backend
    %{"count" => count} = BackendClient.get_counter()
    {:noreply, assign(socket, count: count)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-4">
      <h1 class="text-2xl font-bold mb-4">Live Counter</h1>
      <p class="text-lg">Current count: <%= @count %></p>
    </div>
    """
  end
end
