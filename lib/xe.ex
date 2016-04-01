defmodule Xe do
  @moduledoc ~S"""
  Xe is a dead-simple way of converting between currencies.

  There's only two methods you need to worry about, `Xe.rates` and `Xe.rates!`.

  # Usage

  You can specify currencies as a tuple of atoms or strings:

      {:ok, {_, usd_to_brl}} = Xe.rates({"USD", "BRL"})
      {:ok, {_, usd_to_brl}} = Xe.rates({:usd, :brl})

  Similarly, you can specify currencies as seperate parameters:

      {:ok, {_, usd_to_brl}} = Xe.rates(:usd, :brl)

  You may also use the bang variant, which fails unless the rates can be
  fetched and extracted:

      {_, usd_to_brl} = Xe.rates!(:usd, :brl)
  """

  import Xe.Fetcher, only: [fetch: 2]
  import Xe.Parser, only: [parse: 1]

  @type currency :: atom | binary
  @type rate :: Decimal.t

  @spec rates({from :: currency, to :: currency}) :: {:ok, {rate, rate}} | {:error, any}
  def rates({from, to}), do: rates(from, to)

  @spec rates(from :: currency, to :: currency) :: {:ok, {rate, rate}} | {:error, any}
  def rates(from, to) do
    with {:ok, response} <- fetch(from, to),
         {:ok, rates} <- parse(response.body),
     do: {:ok, rates}
  end

  @spec rates!({from :: currency, to :: currency}) :: {rate, rate}
  def rates!({from, to}), do: rates!(from, to)

  @spec rates!(from :: currency, to :: currency) :: {rate, rate}
  def rates!(from, to) do
    {:ok, rates} = rates(from, to)
    rates
  end
end

