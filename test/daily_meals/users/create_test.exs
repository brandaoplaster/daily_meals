defmodule DailyMeals.Users.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Error
  alias DailyMeals.User

  describe "Create User" do
    test "when all params are valid, returns the user" do
      user_params = build(:user_params)

      {:ok, response} = DailyMeals.create_user(user_params)

      id = response.id

      assert %User{
               name: "Joe",
               cpf: "12345678901",
               email: "joe@gmail.com",
               id: ^id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        cpf: "09876543212",
        email: "Jpbanana.com"
      }

      response = DailyMeals.create_user(params)

      assert {:error, %Error{}} = response
    end
  end
end
