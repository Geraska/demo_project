defmodule DemoProject.OperationName do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "operation_name" do
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
      %{name: "Ревизионное эндопротезирование с применением цементного спейсера с антибиотиком при гнойных осложнениях после эндопротезирования крупных суставов"},
      %{name: "ПОЛНАЯ ЗАМЕНА ТАЗОБЕДРЕННОГО СУСТАВА"},
      %{name: "Частичная замена тазобедренного сустава (биполярный эндопротез)"},
      %{name: "ПОЛНАЯ ЗАМЕНА КОЛЕННОГО СУСТАВА"}
    ]
    |> Enum.map(&insert_name(&1))
  end
end
