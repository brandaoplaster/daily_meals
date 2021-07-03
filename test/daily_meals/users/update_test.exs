defmodule DailyMeals.Users.UpdateTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.{Error, User}

  describe "Update User" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:user_params)

      {_ok, user} = DailyMeals.create_user(user_params)

      response = DailyMeals.update_user(%{"id" => user.id, "name" => "Mike"})

      assert {:ok,
              %User{
                cpf: "12345678901",
                email: "joe@gmail.com",
                name: "Mike"
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = DailyMeals.update_user(%{"id" => id})

      assert {:error, %Error{message: "User not found!", status: :not_found}} = response
    end
  end
end
