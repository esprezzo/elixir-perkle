defmodule Perkle.HexUtils do
  require Logger
  @moduledoc """
  Encoding/Decoding utilities unique to Ethereum Protocol
  """

  @spec hex_to_decimal(binary()) :: number()
  @doc "Converts ethereum-style hex string to decimal number"
  # def hex_to_decimal(nil), do: 0
  def hex_to_decimal(hex_string) do
    hex_string
    |> String.slice(2..-1)
    |> String.to_integer(16)
  end

  @doc """
  Flexibly unhexadecimalize all the things.

  TODO: Look at using a type guard to see if it's an integer or string

  ## Example:
      
      iex> Perkle.unhex(str)

  This is wrong.
  It needs to use decode16 or something.. not assume everything is an int

  """
  @spec unhex(String.t) :: String.t
  def unhex("0x"<>str) do
    unhex(str)
  end
  def unhex(str) do
    str |> Hexate.to_integer
  end

  @doc """
  Hex all the things...
  
  TODO: Infer types better/at all

  ## Example:
    
      iex> Perkle.to_hex(4.0)
      "0x4"
  
  """
  @spec to_hex(integer()) :: String.t
  def to_hex(number) when is_integer(number) do
    "0x" <> Hexate.encode(number)
  end
  # @spec to_hex(String.t()) :: String.t
  # def to_hex(str) do
  #   "0x" <> Hexate.encode(number)
  # end

  @doc """
  Does this look like a valid Perkle address?

  ## Example: 

      iex>  Perkle.is_valid_address?("0x")
      false
      
  """
  def is_valid_address?(address) do
    case String.starts_with?(address, "0x") do
      true ->
        case String.length(address) do
          42 ->
            Logger.info "Address #{address} is valid"
            true
          _ ->
            Logger.info "Address #{address} is valid"
            false
        end
      false -> false 
    end
  end

end