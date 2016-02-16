# Xe

Xe library provides realtime currency conversion

Example:

```elixir
  iex(1)> Xe.fetch({'USD', 'EUR'})
  {:ok, [1.00, 0.891482]}
```

It fecthes realtime conversion from (http://www.xe.com)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add xe to your list of dependencies in `mix.exs`:

        def deps do
          [{:xe, "~> 0.0.1"}]
        end

  2. Ensure xe is started before your application:

        def application do
          [applications: [:xe]]
        end

