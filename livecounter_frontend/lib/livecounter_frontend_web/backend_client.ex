defmodule LivecounterFrontendWeb.BackendClient do
  def get_counter() do
    Req.get!("http://localhost:4000/api/counter").body
  end
end
