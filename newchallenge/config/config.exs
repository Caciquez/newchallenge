# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :newchallenge,
  ecto_repos: [Newchallenge.Repo]

# Configures the endpoint
config :newchallenge, Newchallenge.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2lrZFqW1l/5iVgJNYqb9m96NJEhKbf1kRVlj9hbZv6z4GqN4Umh9K7xVqCiilZMn",
  render_errors: [view: Newchallenge.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Newchallenge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
