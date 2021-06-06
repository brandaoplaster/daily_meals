defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  alias DailyMeals.Meal

  def render("create.json", %{
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
