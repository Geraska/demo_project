defmodule DemoProject.Types.PostoperativeRelief do
  use EctoEnum.Postgres,
    type: :postoperative_relief,
    enums: [:yes, :no]

  @type type :: :yes | :no
end
