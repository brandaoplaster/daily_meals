defmodule DailyMeals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autognerate: true}

  @required_params [:description, :date, :calories]

  schema "meals" do
    field :description, :string
    field :date, :naive_datetime
    field :calories, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_number(:calories, greater_than_or_equal_to: 1)
  end
end
