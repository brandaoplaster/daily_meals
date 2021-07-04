defmodule DailyMeals.UsersControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.User

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "user" => %{
                 "name" => "Joe",
                 "email" => "joe@gmail.com",
                 "cpf" => "12345678901"
               },
               "message" => "User created!"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{description: "Banana"}

      expected_response = %{
        "message" => %{
          "cpf" => ["can't be blank"],
          "name" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
