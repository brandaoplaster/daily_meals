defmodule DailyMeals.MealsTest do
  use DailyMeals.DataCase

  alias Ecto.Changeset

  alias DailyMeals.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{description: "coffee", date: "2021-05-02 11:52:00", calories: 250}

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{description: "coffee", date: ~N[2021-05-02 11:52:00], calories: 250},
               valid?: true
             } = response
    end
  end
end
