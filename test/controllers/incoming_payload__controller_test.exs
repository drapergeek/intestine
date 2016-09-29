defmodule Intestines.IncomingPayloadControllerTest do
  use Intestines.ConnCase
  alias Intestines.Payload
  alias Intestines.Repo

  test "POST /incoming will store the payload", %{conn: conn} do
    payload_body = """
      # My Day
    """
    conn = post conn, "/api/incoming", %{body: payload_body, tag: "twitter"}
    assert json_response(conn, 200)
    assert last_payload.body == payload_body
    assert last_payload.tag == "twitter"
  end

  defp last_payload do
    Payload
    |> Ecto.Query.last
    |> Repo.one
  end
end
