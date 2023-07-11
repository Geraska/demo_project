defmodule DemoProject.Types.Locality do
  use EctoEnum.Postgres,
    type: :locality,
    enums: [:town, :village]

  @type type :: :town | :village
end
