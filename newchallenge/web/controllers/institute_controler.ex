defmodule Newchallenge.InstituteController do
  use Newchallenge.Web, :controller

  alias Newchallenge.Institute
  alias Newchallenge.Course
  plug(:scrub_params, "course" when action in [:add_course])

  def index(conn, _params) do
    ranking =
      Institute
      |> Institute.show_all()
      |> Repo.all()
    render(conn, "index.html", ranking: ranking)
  end

  def new(conn, _params) do
    changeset = Institute.changeset(%Institute{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"institute" => institute_params}) do
    changeset = Institute.changeset(%Institute{}, institute_params)

    case Repo.insert(changeset) do
      {:ok, institute} ->
        conn
        |> put_flash(:info, "Institute inserted sucessfully.")
        |> redirect(to: institute_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    #! !!! remember
    institute = Repo.get(Institute, id) |> Repo.preload([:courses])
    changeset = Institute.changeset(%Course{})
    render(conn, "show.html", institute: institute, changeset: changeset)
  end

  def update(conn, %{"id" => id, "institute" => institute_params}) do
    institute = Repo.get!(Institute, id)
    changeset = Institute.changeset(institute, institute_params)

    case Repo.update(changeset) do
      {:ok, institute} ->
        conn
        |> put_flash(:info, "Institute has been updated sucessfuly.")
        |> redirect(to: institute_path(conn, :index))

      {:error, changeset} ->
        render(conn, "show.html", institute: institute, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Repo.get!(Institute, id)
    |> Ecto.Changeset.change
    |> Ecto.Changeset.no_assoc_constraint(:courses)
    |> Repo.delete

    conn
    |> put_flash(:info, "Institute has been deleted sucessfuly.")
    |> redirect(to: institute_path(conn, :index))
  end

  def add_course(conn, %{"course" => course_params, "institute_id" => institute_id}) do
    changeset = Course.changeset(%Course{}, Map.put(course_params, "institute_id", institute_id))
    institute = Institute |> Repo.get(institute_id) |> Repo.preload([:course])

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Course added.")
      |> redirect(to: course_path(conn, :index))
    else
      render(conn, "show.html", institute: institute, changeset: changeset)
    end
  end
end
