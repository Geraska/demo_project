defmodule DemoProject.Repo.Migrations.AccompanyingIllnesses do
  use Ecto.Migration

  def change do
    create table :accompanying_illnesses do
      add :name, :string
    end
  end
end
