# Xe

Xe is a dead-simple way of converting between currencies. It uses real-time conversion rates from [Xe.com](http://www.xe.com)

## Example

```elixir
  iex(1)> Xe.rates("USD", "EUR")
  {:ok, {1.00, 0.891482}}
```

## Installation

  1. Add `xe` to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:xe, "~> 0.0.1"}]
  end
  ```

  2. Drink your :tea:

  3. Enjoy!
