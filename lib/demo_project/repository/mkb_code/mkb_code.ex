defmodule DemoProject.MkbCode do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "mkb_code" do
    field(:code, :string)
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
      %{code: "S73.0"},
      %{code: "M16.1"},
      %{code: "S72.1"},
      %{code: "S72.0"},
      %{code: "M17.0"},
      %{code: "M16.0"},
      %{code: "M17.1"},
      %{code: "M16.5"},
      %{code: "M16.3"},
      %{code: "T84.7"}
    ]
    |> Enum.map(&insert_code(&1))
  end
end
