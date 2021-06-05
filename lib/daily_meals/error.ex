defmodule DailyMeals.Error do
  alias Ecto.Changeset

  @keys [:status, :message]

  @enforce_keys @keys

  defstruct @keys

  def build(status, message) do
    %__MODULE__{
      status: status,
      message: message
    }
  end

  def build_meal_not_found_error, do: build(:not_found, "Meal not found")

  def build_meal_not_update(%Changeset{} = changeset) do
    build(:bad_request, changeset)
  end
end
