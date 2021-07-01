defmodule DailyMeals.Users.Update do
  alias DailyMeals.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    with %User{} = user <- Repo.get(User, id) do
      do_update(user, params)
    else
      nil -> {:error, Error.build(:not_found, "User not found!")}
    end
  end

  defp do_update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %User{}} = user), do: user

  defp handle_update({:error, result}) do
    {:error, Error.build_not_update(result)}
  end
end
