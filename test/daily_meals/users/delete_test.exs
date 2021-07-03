defmodule DailyMeals.Users.DeleteTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.{Error, User}

  describe "Delete user" do
    test "when a valid id is given, returns the user" do
      params = build(:user_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(params)

      response = DailyMeals.delete_user(id)

      assert {:ok,
              %User{
                cpf: "12345678901",
                email: "joe@gmail.com",
                name: "Joe",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = DailyMeals.delete_user(id)

      assert {:error, %Error{message: "User not found!", status: :not_found}} = response
    end
  end
end
