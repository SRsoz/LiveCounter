defmodule LivecounterWeb.CounterController do
  use LivecounterWeb, :controller

  def show(conn, _params) do
    json(conn, %{count: 123})
  end
end
