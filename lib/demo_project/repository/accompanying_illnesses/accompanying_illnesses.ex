defmodule DemoProject.AccompanyingIllnesses do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "accompanying_illnesses" do
    field(:name, :string)
  end

  @doc """
  Changeset для схемы
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def insert_illness(illness) do
    changeset(%__MODULE__{}, illness)
    |> Repo.insert()
  end

  def insert_illnesses() do
    [
      %{name: "Гипертоническая болезнь"},
      %{name: "Язвенные болезни желудка"},
      %{name: "Сахарный диабет"},
      %{name: "Венерическое заболевание"},
      %{name: "Туберкулёз"},
      %{name: "Болезни Желчевыводящих путей"},
      %{name: "Хронические пиелонефриты"},
      %{name: "Заболевания почек"}
    ]
    |> Enum.map(&insert_illness(&1))
  end
end
