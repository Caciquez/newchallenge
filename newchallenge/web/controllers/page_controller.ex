defmodule Newchallenge.PageController do
  use Newchallenge.Web, :controller

  alias Newchallenge.Institute

  def index(conn, _params) do
    ranking =
      Institute
      |> Institute.show_all()
      |> Repo.all()

    render(conn, "index.html", ranking: ranking)
  end
end
