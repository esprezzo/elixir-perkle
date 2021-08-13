use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
config :tesla, :adapter, {Tesla.Adapter.Hackney, insecure: true}
config :perkle, perkle_rpc_url: System.get_env("PERKLE_HOST")
