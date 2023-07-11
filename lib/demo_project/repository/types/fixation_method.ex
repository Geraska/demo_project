defmodule DemoProject.Types.FixationMethod do
  use EctoEnum.Postgres,
    type: :fixation_method,
    enums: [:cement, :cementless]

  @type type :: :cement | :cementless
end
