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

  describe "get/2" do
    test "when id exist, return the meal", %{conn: conn} do
      params = build(:user_params)

      {_ok, user} = DailyMeals.create_user(params)

      response =
        conn
        |> get(Routes.users_path(conn, :show, user.id))
        |> json_response(:ok)

      expected_response = %{
        "user" => %{
          "cpf" => "12345678901",
          "email" => "joe@gmail.com",
          "name" => "Joe"
        }
      }

      assert expected_response = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> get(Routes.users_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} = response
    end
  end
end
