defmodule XeTest do
  use ExUnit.Case, async: true

  doctest Xe

  test "parsing response" do
    response = [
      {"tr", [{"class", "uccRes"}],
        [{"td", [{"width", "47%"}, {"align", "right"}, {"class", "leftCol"}],
          ["1.00 ", {"span", [{"class", "uccResCde"}], ["EUR"]},
            {:comment, " WARNING: Automated extraction of rates is prohibited under the Terms of Use. "}]},
        {"td", [{"width", "6%"}, {"valign", "middle"}, {"align", "center"}], ["="]},
        {"td", [{"width", "47%"}, {"align", "left"}, {"class", "rightCol"}],
          ["4.36069 ", {"span", [{"class", "uccResCde"}], ["BRL"]},
            {:comment, " WARNING: Automated extraction of rates is prohibited under the Terms of Use. "}]}]}]

    assert Xe.parse_res(response) == {:ok, [Decimal.new("1.00"), Decimal.new("4.36069")]}
  end
end
