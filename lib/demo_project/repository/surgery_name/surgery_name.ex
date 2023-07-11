defmodule DemoProject.SurgeryName do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "surgery_name" do
    field :name, :string
  end

  @doc """
  Changeset для схемы
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

  def insert_name(name) do
    changeset(%__MODULE__{}, name)
    |> Repo.insert()
  end

  def insert_names() do
    [
      %{name: "ТУЛЕУБАЕВ Б.Е"},
      %{name: "РАНГАЕВ С.В"},
      %{name: "СЕМБЕКОВ Е.Ж"},
      %{name: "НУРСЕЙИТОВ Н.К"},
      %{name: "САЛДИН П.Л"},
      %{name: "ШМИДТ С.Я"},
      %{name: "КУРМАНГАЛИЕВ Е.Т"}
    ]
    |> Enum.map(&insert_name(&1))
  end
end
