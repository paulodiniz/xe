# Xe

[![Continuous Integration](https://img.shields.io/travis/paulodiniz/xe/master.svg)](https://travis-ci.org/paulodiniz/xe)
[![Code Coverage](https://img.shields.io/coveralls/paulodiniz/xe/master.svg)](https://coveralls.io/github/paulodiniz/xe)
[![Documentation](http://inch-ci.org/github/paulodiniz/xe.svg)](http://inch-ci.org/github/paulodiniz/xe)
[![Package](https://img.shields.io/hexpm/dt/xe.svg)](https://hex.pm/packages/xe)

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
