defmodule Xe.CLI do

  @default_to "US"

  def main(argv) do
    argv
      |> parse_args
      |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help])
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [from, to], _ }     -> { from, to }
      { _, [from], _ }         -> { from, @default_to }
      _                        -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: xe <from> [ to | #{@default_to} ]
    """
    System.halt(0)
  end

  def process({from, to}) do
    case Xe.fetch(from, to) do
      {:ok, values } -> IO.puts(values)
      {:error, _}    -> IO.puts("Error fetching")
    end
  end
end
