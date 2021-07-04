defmodule DailyMeals.Meals.GetTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.Error

  describe "Get Meal" do
    test "when a valid id is given, returns the meal" do
      user = insert(:user)

      params = %{
        calories: 20,
        date: ~N[2021-05-02 12:00:00],
        description: "Coffee",
        user_id: user.id
      }

      {_ok, meal} = DailyMeals.create_meal(params)

      response = DailyMeals.get_meal_by_id(meal.id)

      expected_response = %{
        calories: 20,
        date: ~N[2021-05-02 12:00:00],
        description: "Coffee"
      }

      assert {:ok, expected_response} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "ce9185ee-dc7e-4751-9e1d-53449696fb33"

      response = DailyMeals.get_meal_by_id(id)

      assert {:error, %Error{message: "Meal not found", status: :not_found}} = response
    end
  end
end
