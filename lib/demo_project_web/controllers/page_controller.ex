defmodule DemoProjectWeb.PageController do
  use DemoProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
