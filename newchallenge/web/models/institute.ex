defmodule Newchallenge.Institute do
  use Newchallenge.Web, :model
  import Ecto.Query

  schema "institutes" do
    field :name, :string
    field :general_score, :integer

    has_many :courses, Newchallenge.Course # new line
    timestamps()
  end


  def show_all(query)do
    from p in query,
          join: c in assoc(p, :courses),
          where: c.institute_id == p.id,
          order_by: [desc: p.general_score],
          select: {p, c}
  end


  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :general_score])
    |> validate_required([:name, :general_score])
  end
end
