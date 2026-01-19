defmodule LivecounterWeb.PageController do
  use LivecounterWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
