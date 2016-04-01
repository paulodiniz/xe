defmodule Xe.Parser do
  @moduledoc false

  def parse(body) do
    body
    |> Floki.find(".uccRes")
    |> extract
  end

  def extract([{"tr", _, tds} | []]), do: {:ok, extract_rates(tds)}
  def extract(_), do: {:error, :unparsable}

  defp extract_rates(tds) do
    tds
    |> Enum.map(&extract_rate_from_td/1)
    |> Enum.reject(&is_nil/1)
    # HACK(mtwilliams): Until https://github.com/elixir-lang/elixir/issues/4421
    # is backported, we have to manually handle non-breaking spaces ourselves :(
    |> Enum.map(&(String.strip(&1, 160)))
    |> Enum.map(&String.strip/1)
    |> Enum.map(&Decimal.new/1)
    |> List.to_tuple
  end

  defp extract_rate_from_td({"td", _, ["="]}), do: nil
  defp extract_rate_from_td({"td", _, values}), do: List.first(values)
end
