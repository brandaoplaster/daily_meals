defmodule DailyMealsWeb.UsersViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import Phoenix.View
  import DailyMeals.Factory

  alias DailyMeals.User
  alias DailyMealsWeb.UsersView

  test "render create.json" do
    user_params = build(:user_params)

    {_ok, user} = DailyMeals.create_user(user_params)

    response = render(UsersView, "create.json", user: user)

    assert %{
             user: %{
               cpf: "12345678901",
               name: "Joe",
               email: "joe@gmail.com",
               id: _id
             },
             message: "User created!"
           } = response
  end

  test "render user.json" do
    user_params = build(:user_params)

    {:ok, %User{id: id} = user} = DailyMeals.create_user(user_params)

    response = render(UsersView, "user.json", user: user)

    assert %{
             user: %{
               cpf: "12345678901",
               name: "Joe",
               email: "joe@gmail.com",
               id: _id
             }
           } = response
  end
end
