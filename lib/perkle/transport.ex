defmodule Perkle.Transport do
  require Logger
  require IEx

  use Tesla

  adapter Tesla.Adapter.Hackney, [ssl_options: [{:versions, [:'tlsv1.2']}]]
  # adapter :hackney, [ssl_optionsg: [{:versions, [:'tlsv1.2']}]]

  plug Tesla.Middleware.Headers, [
    {"content-type", "application/json"},
    {"Api-Key", System.get_env("PERKLE_API_KEY")},
    {"Api-Secret", System.get_env("PERKLE_API_SECRET")},
  ]
  plug Tesla.Middleware.JSON

  @doc false
  @spec send(method :: String.t, params :: map) :: {:ok, map} | {:error, String.t}
  def send(method, params \\ %{}, dehex \\ true) do

    enc = %{
      method: method,
      params: params,
      jsonrpc: "2.0",
      id: 0
    }

    ethereum_host = case System.get_env("PERKLE_HOST") do
      nil ->
        # Logger.error "PERKLE_HOST ENVIRONMENT VARIABLE NOT SET. Using 127.0.0.1"
        "127.0.0.1"
      url ->
        # Logger.info "PERKLE_HOST ENVIRONMENT VARIABLE SET. Using #{url}"
        url
    end

    ethereum_port = case System.get_env("PERKLE_PORT") do
      nil ->
        Logger.error "PERKLE_PORT ENVIRONMENT VARIABLE NOT SET. Using 8545"
        8545
      port ->
        # Logger.info "PERKLE_PORT ENVIRONMENT VARIABLE SET. Using #{port}"
        port
    end


    # Requires --rpcvhosts=* on Eth Daemon - TODO: Clean up move PORT to run script

    daemon_host = case System.get_env("PERKLE_USE_SSL") do
      "true" ->
         "https://" <> ethereum_host <> ":" <> ethereum_port
      _ -> "http://" <> ethereum_host <> ":" <> ethereum_port
    end
    Logger.info "PERKLE DAEMON_HOST: #{daemon_host}"

    {:ok, encoded} = Jason.encode(enc)
    result =
      __MODULE__.post!(daemon_host, encoded)
      |> Map.get(:body)
      |> Map.get("result")

    Logger.warn "#{inspect result}"

    result =
      case dehex do
        true ->
          __MODULE__.unhex(result)
        false ->
          result
      end
    {:ok, result}
  end

  # @doc """
  # Transport macro function to strip Ethereum 0x for easier decoding later.

  # ## Example:

  #     iex> __MODULE__.unhex("0x557473f9c6029a2d4b7ac8a37aa407414db6820faf1f7fa48b3b038f857d5aac")
  #     "557473f9c6029a2d4b7ac8a37aa407414db6820faf1f7fa48b3b038f857d5aac"
  # """
  @doc false
  @spec unhex(String.t) :: String.t
  def unhex("0x"<>str) do
    str
  end
  def unhex(str) do
    str
  end

end
