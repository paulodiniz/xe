defmodule Xe do
  def fetch({from, to}) do
    url(from, to)
    |> HTTPoison.get
    |> handle_response
  end

  def url(from, to) do
    "http://www.xe.com/currencyconverter/convert/?From=#{from}&To=#{to}"
  end

  def handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    body
    |> Floki.find(".uccRes")
    |> parse_res
  end

  def parse_res([{"tr", _, tds} | []]), do: {:ok, fetch_values(tds)}
  def parse_res([_ | []]), do: {:error, [nil, nil]}

  def fetch_values(tds) do
    tds
    |> Enum.map(&fetch_value_from_td/1)
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&String.strip/1)
    |> Enum.map(&Decimal.new/1)
  end

  def fetch_value_from_td({"td", _, ["="]}), do: nil
  def fetch_value_from_td({"td", _, values}), do: List.first(values)
end

