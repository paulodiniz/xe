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

  def parse_res([_head, _ | _tail]), do: {:error, [nil, nil]}
  def parse_res([head | []]) do
    case head do
      {"tr", _, tds} -> {:ok, fetch_values(tds) }
      _              -> {:error, [nil, nil]}
    end
  end

  def fetch_values(tds) do
    tds
      |> Enum.map(&fetch_value_from_td(&1))
      |> Enum.reject(fn(x) -> is_nil(x) end)
  end

  def fetch_value_from_td(td) do
    case td do
      {"td", _, ["="]}  -> nil
      {"td", _, values} -> List.first(values)
    end
  end

end
