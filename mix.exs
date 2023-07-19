defmodule Perkle.Mixfile do
  use Mix.Project

  def project do
    [app: :perkle,
     version: "0.1.0",
     elixir: "~> 1.12",
     package: package(),
     description: description(),
     name: "Perkle",
     source_url: "https://github.com/esprezzo/elixir-perkle",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {Perkle.Application, []}]
  end

  defp package do
    # These are the default files included in the package
    [
      name: :perkle,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["AW"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/esprezzo/elixir-perkle"}
    ]
  end


  defp description do
     """
     This library exists to present a convenient interface to control a full Perkle node from Elixir, abstracting away the need to deal with the JSON-RPC API directly.
     """
  end

  defp deps do
    [
      {:tesla, "~> 1.7.0"},
      # {:ex_keccak, "~> 0.3.0"},
      {:ex_abi, "~> 0.5.9"},
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.30", only: :dev},
      {:hackney, "~> 1.18"},
      {:poison, "~> 5.0"},
   ]
  end
end

# {:tesla, "~> 1.3.0"},
# # optional, but recommended adapter
# {:hackney, "~> 1.16.0"},
# # {:ex_abi, "git: https://github.com/alanwilhelm/ex_abi.git"},
# {:ex_abi, "~> 0.5.1"},
# {:ex_keccak, "~> 0.1.2"},
# # optional, required by JSON middleware
# {:jason, ">= 1.0.0"},
# {:hexate,  ">= 0.6.0"},
# {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
#  {:ex_doc, "~> 0.14", only: :dev}
