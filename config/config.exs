# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :intestines,
  ecto_repos: [Intestines.Repo]

# Configures the endpoint
config :intestines, Intestines.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iLEU/jhqELYSchFFA6G1Pz8kqcue9vQSvZVUQJ9rbs3U9nvC0U47gko5DxhGcPX1",
  render_errors: [view: Intestines.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Intestines.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :rollbax,
  access_token: System.get_env("ROLLBAR_ACCESS_TOKEN"),
  environment: "production"
