use Mix.Config

config :config, ini_files: [
    # "./config/etc" |> String.to_charlist,
    "./config/db/default.ini" |> String.to_charlist,
    "./config/db/local.ini" |> String.to_charlist,
  ]

config :couch_epi, plugins: [
      :couch_db_epi,
      :chttpd_epi,
      :couch_index_epi,
      :global_changes_epi,
      :mango_epi,
      :mem3_epi
      # :setup_epi
    ]


import_config "#{Mix.env}.exs"
