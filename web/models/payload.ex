defmodule Intestines.Payload do
  use Intestines.Web, :model

  schema "payloads" do
    field :body, :string
    field :tag, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :tag])
    |> validate_required([:body])
  end
end
