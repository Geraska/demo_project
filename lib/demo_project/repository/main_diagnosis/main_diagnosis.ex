defmodule DemoProject.MainDiagnosis do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "main_diagnosis" do
    field(:diagnosis, :string)
  end

  @doc """
  Changeset для схемы
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:diagnosis])
    |> validate_required([:diagnosis])
  end

  def insert_diagnosis(diagnosis) do
    changeset(%__MODULE__{}, diagnosis)
    |> Repo.insert()
  end

  def insert_diagnosises() do
    [
      %{
        diagnosis: "Вывих бедра"
      },
      %{diagnosis: "Другой первичный коксартроз"},
      %{diagnosis: "Чрезвертельный перелом"},
      %{diagnosis: "Первичный гонартроз двусторонний"},
      %{diagnosis: "Первичный коксартроз двусторонний"},
      %{diagnosis: "Другой первичный гонартроз"},
      %{diagnosis: "Другие посттравматические коксартрозы"},
      %{
        diagnosis:
          "Инфекция и воспалительная реакция, обусловленные другими внутренними ортопедическими протезными устройствами, имплантатами и трансплантатами"
      },
      %{diagnosis: "Перелом шейки бедра"}
    ]
    |> Enum.map(&insert_diagnosis(&1))
  end
end
