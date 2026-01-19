defmodule LivecounterFrontendWeb.PageController do
  use LivecounterFrontendWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
