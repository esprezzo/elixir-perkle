defmodule Perkle.Units do
  @moduledoc """
    Module for @Type that represents Perkle.Unit struct with various ether denominations
  """

  alias Perkle.Units
  @typedoc """
    Type that represents Perkle.Unit struct with various ether denominations
  """
  @type t :: %Units{
    wei: integer,
    kwei: integer,
    Kwei: integer,
    babbage: integer,
    femtoether: integer,
    mwei: integer,
    Mwei: integer,
    lovelace: integer,
    picoether: integer,
    gwei: integer,
    Gwei: integer,
    shannon: integer,
    nanoether: integer,
    nano: integer,
    szabo: integer,
    microether: integer,
    micro: integer,
    finney: integer,
    milliether: integer,
    milli: integer,
    ether: integer,
    eth: integer,
    kether: integer,
    grand: integer,
    mether: integer,
    gether: integer,
    tether: integer
  }


  defstruct  [
      wei:          1,
      kwei:         1000,
      Kwei:         1000,
      babbage:      1000,
      femtoether:   1000,
      mwei:         1000000,
      Mwei:         1000000,
      lovelace:     1000000,
      picoether:    1000000,
      gwei:         1000000000,
      Gwei:         1000000000,
      shannon:      1000000000,
      nanoether:    1000000000,
      nano:         1000000000,
      szabo:        1000000000000,
      microether:   1000000000000,
      micro:        1000000000000,
      finney:       1000000000000000,
      milliether:   1000000000000000,
      milli:        1000000000000000,
      ether:        1000000000000000000,
      eth:          1000000000000000000,
      kether:       1000000000000000000000,
      grand:        1000000000000000000000,
      mether:       1000000000000000000000000,
      gether:       1000000000000000000000000000,
      tether:       100000000000000000000000000000,
    ]

end
