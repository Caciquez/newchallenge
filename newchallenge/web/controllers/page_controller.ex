defmodule Newchallenge.PageController do
  use Newchallenge.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
