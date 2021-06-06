defmodule DailyMealsWeb.MealsController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Meal
  alias DailyMealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- DailyMeals.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end
end