defmodule Xe.CLI do

  @default_to "US"

  def run(argv) do
    parse_args(argv)
  end
  
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help])
    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [from, to], _ }     -> { from, to }
      { _, [from], _ }         -> { from, @default_to }
    end
  end
end
