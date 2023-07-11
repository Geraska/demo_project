defmodule DemoProject.Repo.Migrations.SurgeryName do
  use Ecto.Migration

  def change do
    create table :surgery_name do
      add :name, :string
    end
  end
end
