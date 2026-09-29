import Config

config :phoenix, plug_init_mode: :runtime
config :logger, level: :warning

config :eunice,
       EuniceWeb.Endpoint,
       http: [ip: {127, 0, 0, 1}, port: 4002],
       secret_key_base: "sBQCuqBJqhF9TJIpkqoYmLfy88ahZFSoWeGOk5CM4G8xPC8SdgOxofoMzciIq2KT",
       server: false
