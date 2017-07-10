defmodule CouchdbLuerlQuery.Mixfile do
  use Mix.Project

  def project do
    [app: :couchdb_luerl_query,
     version: "0.1.0",
     elixir: "~> 1.4",
     compilers: [:erlang, :app],
     erlc_options: [{:parse_transform}],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  def application, do: application(Mix.env)

  def application(:test) do
    # Specify extra applications you'll use from Erlang/Elixir
    testapps = case Mix.env do
      :test -> [:couchdb_mixapp]
      _ -> []
    end

    [extra_applications: [ :logger ] ++ testapps]
  end

  def application(_other) do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [
      :logger,
    ]]
  end

  # Dependencies can be Hex packages:
  defp deps do
    [
      {:luerl, "~> 0.3.0"},
      # {:couchdb, github: "elcritch/couchdb-embedded", branch: "2.1.x-nocouchjs", manager: :rebar, app: false},
      {:couchdb_mixapp, "~> 0.2.0", github: "elcritch/couchdb_mixapp", runtime: false},
      {:mix_erlang_tasks, "0.1.0"},
      {:distillery, "~> 1.4.1"},
    ]
  end
end
