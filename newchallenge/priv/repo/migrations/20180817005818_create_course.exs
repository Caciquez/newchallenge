defmodule Newchallenge.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :general_score, :integer
      add :student_score, :integer
      add :institute_id, references(:institutes, on_delete: :nothing)

      timestamps()
    end

    create index(:courses, [:institute_id])
  end
end
