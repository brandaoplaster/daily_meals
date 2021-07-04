defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.{Meal, User}

  def user_params_factory do
    %{
      name: "Joe",
      cpf: "12345678901",
      email: "joe@gmail.com"
    }
  end

  def user_factory do
    %User{
      name: "Joe",
      cpf: "12345678901",
      email: "joe@gmail.com",
      id: "69961117-d966-4e2f-ac55-476d4f78dddf"
    }
  end

  def meals_params_factory do
    %{
      calories: 20,
      date: ~N[2021-05-02 12:00:00],
      description: "Coffee",
      user_id: "388fccf4-f3bb-4822-9817-973a62158d20"
    }
  end

  def meal_factory do
    %Meal{
      calories: 20,
      date: ~N[2021-05-02 12:00:00],
      description: "Coffee",
      user_id: "388fccf4-f3bb-4822-9817-973a62158d20",
      id: "69961117-d966-4e2f-ac55-476d4f78ddfa"
    }
  end
end
