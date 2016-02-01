defmodule Xe do
  def fetch(from, to) do
    url(from, to)
    |> HTTPoison.get
    |> handle_response
  end

  def url(from, to) do
    "http://www.xe.com/currencyconverter/convert/?From=#{from}&To=#{to}"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: {:ok, body}
end
