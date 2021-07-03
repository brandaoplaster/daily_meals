defmodule DailyMeals.Users.GetTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.{Error, User}

  describe "Get User" do
    test "when a valid id is given, returns the user" do
      user_params = build(:user_params)

      {_ok, user} = DailyMeals.create_user(user_params)

      response = DailyMeals.get_user_by_id(user.id)

      assert {:ok,
              %User{
                cpf: "12345678901",
                email: "joe@gmail.com",
                name: "Joe"
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = DailyMeals.get_user_by_id(id)

      assert {:error, %Error{message: "User not found", status: :not_found}} = response
    end
  end
end
