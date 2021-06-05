defmodule DailyMeals.Meals.Get do
  alias DailyMeals.{Error, Meal, Repo}

  def get_by_id(id) do
    with %Meal{} = meal <- Repo.get(Meal, id) do
      {:ok, meal}
    else
      nil -> {:error, Error.build_meal_not_found_error()}
    end
  end
end
