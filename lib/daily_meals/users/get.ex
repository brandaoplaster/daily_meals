defmodule DailyMeals.Users.Get do
  alias DailyMeals.{Error, Repo, User}

  def get_user_by_id(id) do
    with %User{} = user <- Repo.get(User, id) do
      {:ok, user}
    else
      nil -> {:error, Error.build(:not_found, "User not found")}
    end
  end
end
