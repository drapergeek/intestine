defmodule Intestines.PayloadTest do
  use Intestines.ModelCase

  alias Intestines.Payload

  @valid_attrs %{body: "some content", tag: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Payload.changeset(%Payload{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Payload.changeset(%Payload{}, @invalid_attrs)
    refute changeset.valid?
  end
end
