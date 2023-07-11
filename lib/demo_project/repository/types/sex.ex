defmodule DemoProject.Types.Sex do
  use EctoEnum.Postgres,
    type: :sex,
    enums: [:male, :female]

  @type type :: :male | :female
end
