defmodule Unicode.Guards.MixProject do
  use Mix.Project

  @version "0.3.1"

  def project do
    [
      app: :unicode_guards,
      version: @version,
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      name: "Unicode function guards for Elixir",
      source_url: "https://github.com/elixir-unicode/unicode_guards",
      description: description(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  defp description do
    """
    Implementation of Unicode Set-based guards for Elixir. Supports matching
    unicode sets to codepoints that can be used in function guards.
    """
  end

  defp package do
    [
      maintainers: ["Kip Cole"],
      licenses: ["Apache 2.0"],
      logo: "logo.png",
      links: links(),
      files: [
        "lib",
        "logo.png",
        "mix.exs",
        "README*",
        "CHANGELOG*",
        "LICENSE*"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:unicode_set, "~> 0.5"},
      {:nimble_parsec, "~> 0.5", runtime: false},
      {:benchee, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.19", only: [:dev, :test, :release], runtime: false}
    ]
  end

  def links do
    %{
      "GitHub" => "https://github.com/elixir-unicode/unicode_guards",
      "Readme" => "https://github.com/elixir-unicode/unicode_guards/blob/v#{@version}/README.md",
      "Changelog" => "https://github.com/elixir-unicode/unicode_guards/blob/v#{@version}/CHANGELOG.md"
    }
  end

  def docs do
    [
      source_ref: "v#{@version}",
      main: "readme",
      logo: "logo.png",
      extras: [
        "README.md",
        "LICENSE.md",
        "CHANGELOG.md"
      ],
      skip_undefined_reference_warnings_on: ["changelog"]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(:dev), do: ["lib", "bench"]
  defp elixirc_paths(_), do: ["lib"]
end
