defmodule DemoProject.Departments do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "departments" do
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

  def insert_department(department) do
    changeset(%__MODULE__{}, department)
    |> Repo.insert()
  end
end
