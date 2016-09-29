defmodule Intestines.Repo.Migrations.CreatePayload do
  use Ecto.Migration

  def change do
    create table(:payloads) do
      add :body, :text, null: false
      add :tag, :string

      timestamps null: false
    end

  end
end
