defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  alias DailyMeals.Meal

  def render("create.json", %{meal: %Meal{}} = meal) do
    %{
      message: "Meal created",
      meal: %{
        id: meal.id,
        description: meal.description,
        date: meal.date,
        calories: meal.calories
      }
    }
  end
end
