defmodule DailyMealsWeb.UsersView do
  use DailyMealsWeb, :view

  alias DailyMeals.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        cpf: user.cpf,
        email: user.email
      },
      message: "User created!"
    }
  end

  def render("user.json", %{user: %User{} = user}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        cpf: user.cpf,
        email: user.email
      },
      message: "Updated user!"
    }
  end
end
