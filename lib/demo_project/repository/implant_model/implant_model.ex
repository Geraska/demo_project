defmodule DemoProject.ImplantModel do
  use Ecto.Schema

  import Ecto.Changeset
  alias DemoProject.Repo
  # import EctoEnum

  @doc """
  Схема для Сопутствующие заболевания
  """
  schema "implant_model" do
    field(:model, :string)
  end

  @doc """
  Changeset для схемы
  """
  def changeset(struct, params) do
    struct
    |> cast(params, [:model])
    |> validate_required([:model])
  end

  def insert_model(model) do
    changeset(%__MODULE__{}, model)
    |> Repo.insert()
  end

  def insert_models() do
    [
      %{model: "Stryker Triathlon"},
      %{model: "Evolutis"},
      %{model: "Freedom"},
      %{model: "Accolade"},
      %{model: "Aesculap"},
      %{model: "Exeter"},
      %{model: "Skorpio"},
      %{model: "Corail"},
      %{model: "Bipolar"},
      %{model: "DePuy"}
    ]
    |> Enum.map(&insert_model(&1))
  end
end
