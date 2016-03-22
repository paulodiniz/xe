defmodule Xe.Mixfile do
  use Mix.Project

  def project do
    [name: "Xe",
     app: :xe,
     version: version,
     description: "Real time conversion for currencies.",
     homepage_url: homepage_url,
     source_url: github_url,
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     escript: escript_config,
     package: package,
     docs: docs]
  end

  def application do
    [applications: applications(Mix.env)]
  end

  defp applications(_), do: ~w()a ++ applications
  defp applications, do: ~w(logger decimal httpoison)a

  defp homepage_url, do: github_url
  defp github_url, do: "https://github.com/paulodiniz/xe"
  defp documentation_url, do: "https://github.com/paulodiniz/xe"

  defp version do
    case System.cmd("git", ["describe", "--tags"], stderr_to_stdout: true) do
      {tag, 0} ->
        String.strip(tag)
      _ ->
        "0.0.0"
    end
  end

  defp elixirc_paths(:test), do: ~w(test/support) ++ elixirc_paths
  defp elixirc_paths(_), do: elixirc_paths
  defp elixirc_paths, do: ~w(lib)

  defp deps do
    [{:decimal, "~> 1.0"},
     {:httpoison, "~> 0.8"},
     {:floki, "~> 0.7"},
     {:ex_doc, "~> 0.10", only: :docs},
     {:earmark, "~> 0.1", only: :docs}]
  end

  defp escript_config do
    [main_module: Xe.CLI]
  end

  defp package do
    [maintainers: ["Paulo Diniz"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => github_url, "Docs" => documentation_url},
     files: ~w(mix.exs lib README* LICENSE*)]
  end

  defp docs do
    [main: "Xe",
     canonical: "http://hexdocs.pm/xe",
     source_ref: version,
     source_url: github_url]
  end
end
