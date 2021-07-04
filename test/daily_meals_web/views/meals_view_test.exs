defmodule DailyMealsWeb.MealsViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import Phoenix.View
  import DailyMeals.Factory

  alias DailyMealsWeb.MealsView

  test "render create.json" do
    user = insert(:user)

    params = %{
      calories: 20,
      date: ~N[2021-05-02 12:00:00],
      description: "Coffee",
      user_id: user.id
    }

    {_ok, meal} = DailyMeals.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %{
               calories: 20,
               date: ~N[2021-05-02 12:00:00],
               description: "Coffee",
               id: _id
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    user = insert(:user)

    params = %{
      calories: 20,
      date: ~N[2021-05-02 12:00:00],
      description: "Coffee",
      user_id: user.id
    }

    {_ok, meal} = DailyMeals.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %{
               calories: 20,
               date: ~N[2021-05-02 12:00:00],
               description: "Coffee",
               id: _id
             }
           } = response
  end
end
