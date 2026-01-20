defmodule LivecounterWeb.CounterState do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def get(), do: Agent.get(__MODULE__, & &1)

  def increment(), do: Agent.update(__MODULE__, &(&1 + 1))

  def decrement(), do: Agent.update(__MODULE__, &(&1 - 1))
end
