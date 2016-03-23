defmodule Xe.Mixfile do
  use Mix.Project

  def project do
    [app: :xe,
     version: "0.0.1",
     elixir: "~> 1.2",
     escript: escript_config,
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      { :httpoison, "~> 0.8.0" },
      { :floki, "~> 0.7"},
    ]
  end

  defp escript_config do
    [ main_module: Xe.CLI ]
  end

  defp description do
    """
      Real time conversion for currencies
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
     maintainers: ["Paulo Diniz"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/paulodiniz/xe",
              "Docs" => "https://github.com/paulodiniz/xe"}]
  end
end
