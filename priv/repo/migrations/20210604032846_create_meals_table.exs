defmodule DailyMeals.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals do
      add :description, :string
      add :consumption_date, :naive_datetime
      add :calories, :integer

      timestamps()
    end
  end
end
