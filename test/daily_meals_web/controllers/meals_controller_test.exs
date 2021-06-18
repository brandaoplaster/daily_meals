defmodule DailyMeals.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates a meal", %{conn: conn} do
      params = %{
        calories: 20,
        date: ~N[2021-05-02 12:00:00],
        description: "Coffee"
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create), params)
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "calories" => 20,
                 "date" => "2021-05-02T12:00:00",
                 "description" => "Coffee",
                 "id" => _id
               },
               "message" => "Meal created!"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{description: "Banana"}

      expected_response = %{
        "message" => %{"calories" => ["can't be blank"], "date" => ["can't be blank"]}
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "get/2" do
  end

  describe "delete/2" do
  end

  describe "update/2" do
  end
end
