defmodule Newchallenge.Course do
  use Newchallenge.Web, :model

  schema "courses" do
    field(:name, :string)
    field(:general_score, :integer)
    field(:student_score, :integer)
    belongs_to(:institute, Newchallenge.Institute, foreign_key: :institute_id)

    timestamps()
  end


  @required_fields ~w(name general_score student_score institute_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    #|> validate_required([:name, :general_score, :student_score])
  end
end
