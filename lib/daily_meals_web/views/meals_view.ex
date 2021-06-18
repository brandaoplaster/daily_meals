defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  alias DailyMeals.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      meal: %{
        id: meal.id,
        description: meal.description,
        date: meal.date,
        calories: meal.calories
      },
      message: "Meal created!"
    }
  end

  def render("meal.json", %{
        meal: %Meal{
          id: id,
          description: description,
          date: date,
          calories: calories
        }
      }) do
    %{
      meal: %{
        id: id,
        description: description,
        date: date,
        calories: calories
      }
    }
  end
end
