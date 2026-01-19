defmodule Livecounter.Counter do
  use GenServer

  def start_link(_args) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def value do
    GenServer.call(__MODULE__, :get)
  end

  def increment do
    GenServer.call(__MODULE__, :inc)
  end

  def decrement do
    GenServer.call(__MODULE__, :dec)
  end

  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:inc, _from, state) do
    new_value = state + 1
    {:reply, new_value, new_value}
  end

  def handle_call(:dec, _from, state) do
    new_value = state - 1
    {:reply, new_value, new_value}
  end
end
