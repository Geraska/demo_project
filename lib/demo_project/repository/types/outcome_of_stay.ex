defmodule DemoProject.Types.OutcomeOfStay do
  use EctoEnum.Postgres,
    type: :posoperative_relief,
    enums: [:discharged, :translated, :gone]

  @type type :: :discharged | :translated | :gone
end
