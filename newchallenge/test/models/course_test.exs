defmodule Newchallenge.CourseTest do
  use Newchallenge.ModelCase

  alias Newchallenge.Course

  @valid_attrs %{general_score: 42, name: "some name", student_score: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Course.changeset(%Course{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Course.changeset(%Course{}, @invalid_attrs)
    refute changeset.valid?
  end
end
