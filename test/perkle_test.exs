
defmodule PerkleTest do
  use ExUnit.Case
  require IEx

  doctest Perkle

  # TODO: cover all non-network features
  describe "hexutils module" do

    test "to_hex/1 works on integer" do
      assert Perkle.to_hex(1440002) == "0x15f902"
    end

  end
  
end
