defmodule Mix.Tasks.SendDigests do
  use Mix.Task
  alias Intestines.Payload
  alias Intestines.Repo

  @shortdoc "Send all the digests, split by tag."
  def run(args) do
    url = List.first(args) || System.get_env("WEBHOOK_URL")
    Mix.Task.run "app.start", []

    grouped_by_tag =
      Payload
      |> Repo.all
      |> Enum.group_by(&(&1.tag))

    for {tag, items} <- grouped_by_tag do
      grouped_text =
        items
        |> Enum.map(&(&1.body))
        |> Enum.join("\n\n")

      date = Timex.format(Timex.today, "%A, %b %d", :strftime)
      combined = "# #{tag} Digest for #{date} \n\n #{grouped_text}"
      HTTPoison.start
      body = Poison.encode!(%{value1: combined, value2: tag})
      HTTPoison.post(url, body, [{"Content-Type", "application/json"}])
    end

    Payload |> Repo.delete_all
  end
end
