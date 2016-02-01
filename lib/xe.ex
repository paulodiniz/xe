defmodule Xe do
  def fetch(from, to) do
    url(from, to)
    |> HTTPoison.get
    |> handle_response
  end

  def url(from, to) do
    "http://www.xe.com/currencyconverter/convert/?From=#{from}&To=#{to}"
  end

  def handle_response(%{status_code: 200, body: body}), do: {:ok, body}
  def handle_response(%{status_code: _,   body: body}), do: {:error, body}
end
