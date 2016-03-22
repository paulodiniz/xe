defmodule Xe.Fetcher do
  @moduledoc ~S"""
  """

  # Make the base url we use to fetch rates from overridable so we can use mock
  # edpoints for end-to-end testing.
  @default_base_url "http://www.xe.com"
  defp base_url, do: Application.get_env(:xe, :base_url, @default_base_url)

  defp url(from, to) do
    "#{base_url}/currencyconverter/convert/?From=#{from}&To=#{to}"
  end

  def fetch(from, to) do
    url(from, to)
    |> HTTPoison.get
    |> handle
  end

  defp handle({:ok, %{status_code: 200} = response}), do: {:ok, response}
  defp handle({:error, error}), do: {:error, :unfetchable}
end
