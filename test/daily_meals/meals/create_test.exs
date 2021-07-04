defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.Error

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      user = insert(:user)

      params = %{
        calories: 20,
        date: ~N[2021-05-02 12:00:00],
        description: "coffee",
        user_id: user.id
      }

      response = DailyMeals.create_meal(params)

      expected_response = %{
        calories: 20,
        date: ~N[2021-05-02 12:00:00],
        description: "coffee"
      }

      assert {:ok, expected_response} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~N[2001-05-02 12:00:00]
      }

      response = DailyMeals.create_meal(params)

      expected_response = %{description: ["can't be blank"], user_id: ["can't be blank"]}

      assert {:error, %Error{status: :bad_request, message: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
