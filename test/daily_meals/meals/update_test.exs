defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.Error

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      user = insert(:user)

      params = %{
        calories: 20,
        date: ~N[2021-05-02 12:00:00],
        description: "Coffee",
        user_id: user.id
      }

      {_ok, meal} = DailyMeals.create_meal(params)

      response = DailyMeals.update_meal(%{"id" => meal.id, "calories" => 100})

      expected_response = %{
        calories: 100,
        date: ~N[2021-05-02 12:00:00],
        description: "Coffee"
      }

      assert {:ok, expected_response} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "ce9185ee-dc7e-4751-9e1d-53449696fb33"

      response = DailyMeals.update_meal(%{"id" => id})

      assert {:error, %Error{message: "Meal not found", status: :not_found}} = response
    end
  end
end
