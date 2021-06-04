defmodule DailyMeals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autognerate: true}

  @required_params [:description, :consumption_date, :calories]

  schema "meals" do
    field :description, :string
    field :consumption_date, :naive_datetime
    field :calories, :integer

    timestamps()
  end

  def changeset(params) do
  end
end
