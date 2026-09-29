defmodule EuniceWeb.Router do
  use EuniceWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {EuniceWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", EuniceWeb do
    pipe_through([:browser])
    live("/", WifiLive)
    live("/drive", DriveLive)
  end

  scope "/" do
    pipe_through([:browser])
    import BB.LiveView.Router
    bb_dashboard("/dashboard", robot: Eunice.Robot)
  end

  scope "/api", EuniceWeb do
    pipe_through(:api)
  end
end
