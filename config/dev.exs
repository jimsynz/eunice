import Config

config :phoenix, stacktrace_depth: 20, plug_init_mode: :runtime
config :logger, default_formatter: [format: "[$level] $message
"]
config :eunice, dev_routes: true

config :eunice,
       EuniceWeb.Endpoint,
       http: [ip: {127, 0, 0, 1}, port: 4000],
       check_origin: false,
       code_reloader: true,
       debug_errors: true,
       secret_key_base: "Ay/XW+JjLk7NtxvAB+iSqgX5Rl4gvruNjB8cv5goM6mUwvuPADWGKcDQR3g7ibHL",
       watchers: [],
       live_reload: []

# Only on a developer's machine. A Nerves firmware is built out of `:dev`,
# and a board has no asset toolchain to run and no source tree to watch.
if Mix.target() == :host do
  config :eunice, EuniceWeb.Endpoint,
    watchers: [
      esbuild: {Esbuild, :install_and_run, [:eunice, ["--sourcemap=inline", "--watch"]]},
      tailwind: {Tailwind, :install_and_run, [:eunice, ["--watch"]]}
    ],
    live_reload: [
      web_console_logger: true,
      patterns: [
        ~r"priv/static/(?!uploads/).*\.(js|css|png|jpeg|jpg|gif|svg)$"E,
        ~r"lib/.*_web/router\.ex$"E,
        ~r"lib/.*_web/(controllers|live|components)/.*\.(ex|heex)$"E
      ]
    ]
end
