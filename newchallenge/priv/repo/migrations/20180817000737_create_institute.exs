defmodule Newchallenge.Repo.Migrations.CreateInstitute do
  use Ecto.Migration

  def change do
    create table(:institutes) do
      add :name, :string
      add :general_score, :integer

      timestamps()
    end
  end
end
