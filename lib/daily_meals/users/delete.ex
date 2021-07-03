defmodule DailyMeals.Users.Delete do
  alias DailyMeals.{Error, Repo, User}

  def call(id) do
    with %User{} = user <- Repo.get(User, id) do
      Repo.delete(user)
    else
      nil -> {:error, Error.build(:not_found, "User not found!")}
    end
  end
end
