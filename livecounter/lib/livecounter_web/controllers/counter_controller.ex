defmodule LivecounterWeb.CounterController do
  use LivecounterWeb, :controller
 alias LivecounterWeb.CounterState

  def show(conn, _params) do
    json(conn, %{count: CounterState.get()})
  end

def increment(conn, _params) do
    CounterState.increment()
    json(conn, %{count: CounterState.get()})
  end

  def decrement(conn, _params) do
    CounterState.decrement()
    json(conn, %{count: CounterState.get()})
  end
end
