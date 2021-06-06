defmodule DailyMeals.Meals.Delete do
  alias DailyMeals.{Error, Meal, Repo}

  def call(id) do
    with %Meal{} = meal <- Repo.get(Meal, id) do
      Repo.delete(meal)
    else
      nil -> {:error, Error.build_meal_not_found_error()}
    end
  end
end
