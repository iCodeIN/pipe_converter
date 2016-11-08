defmodule PipeConverter.CLITest do
  use ExUnit.Case
  import PipeConverter.CLI
  import ExUnit.CaptureIO
  doctest PipeConverter.CLI

  describe "main/1" do
    test "print to IO" do
      assert capture_io(fn -> main(["--revert","inner |> outer"]) end) ==
             "outer(inner)\n"
      assert capture_io(fn -> main(["outer(inner)"]) end) ==
             "inner |> outer\n"
    end
  end
end