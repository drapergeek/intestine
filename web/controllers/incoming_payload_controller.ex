defmodule Intestines.IncomingPayloadController do
  use Intestines.Web, :controller
  alias Intestines.Payload
  alias Intestines.Repo

  def create(conn, params) do
    %Payload{}
    |> Payload.changeset(params)
    |> Repo.insert

    json conn, %{}
  end
end
