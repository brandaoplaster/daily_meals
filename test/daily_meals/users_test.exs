defmodule DailyMeals.UsersTest do
  use DailyMeals.DataCase

  alias DailyMeals.User
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "joe",
        cpf: "12345678912",
        email: "joe@gmail.com"
      }

      response = User.changeset(params)

      expected_response = %Changeset{
        changes: %{
          name: "joe",
          cpf: "12345678912",
          email: "joe@gmail.com"
        },
        valid?: true
      }

      assert expected_response = response
    end
  end
end
