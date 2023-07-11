defmodule DemoProject.OperationCode do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "operation_code" do
    field :code, :string
  end

  @doc """
  Changeset для схемы
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:code])
    |> validate_required([:code])
  end

  def insert_code(code) do
    changeset(%__MODULE__{}, code)
    |> Repo.insert()
  end

  def insert_codes() do
    [
      %{code: "81.591"},
      %{code: "81.51"},
      %{code: "81.52"},
      %{code: "81.54"}
    ]
    |> Enum.map(&insert_code(&1))
  end
end
