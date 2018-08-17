defmodule Newchallenge.InstituteTest do
  use Newchallenge.ModelCase

  alias Newchallenge.Institute

  @valid_attrs %{general_score: 42, name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Institute.changeset(%Institute{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Institute.changeset(%Institute{}, @invalid_attrs)
    refute changeset.valid?
  end
end
