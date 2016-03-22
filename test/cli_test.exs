defmodule CliTest do
  use ExUnit.Case, async: true

  import Xe.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h",    "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "two values returned if two given" do
    assert parse_args(["BR", "EUR"]) == { "BR", "EUR" }
  end

  test "to is default to USD if one value is given" do
    assert parse_args(["BR"]) == { "BR", "USD" }
  end
end
