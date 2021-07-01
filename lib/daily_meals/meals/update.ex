defmodule DailyMeals.Meals.Update do
  alias DailyMeals.{Error, Meal, Repo}

  def call(%{"id" => id} = params) do
    with %Meal{} = meal <- Repo.get(Meal, id) do
      do_update(meal, params)
    else
      nil -> {:error, Error.build_meal_not_found_error()}
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Meal{}} = meal), do: meal

  defp handle_update({:error, result}) do
    {:error, Error.build_not_update(result)}
  end
end
