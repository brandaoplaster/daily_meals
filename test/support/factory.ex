defmodule DailyMeals.Factory do
  use ExMachina.Ecto

  def user_params_factory do
    %{
      name: "Joe",
      cpf: "12345678901",
      email: "joe@gmail.com"
    }
  end
end
