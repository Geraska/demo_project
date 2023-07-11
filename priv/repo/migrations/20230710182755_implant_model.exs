defmodule DemoProject.Repo.Migrations.ImplantModel do
  use Ecto.Migration

  def change do
    create table :implant_model do
      add :model, :string
    end
  end
end
