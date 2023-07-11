defmodule DemoProject.Repo.Migrations.MkbCode do
  use Ecto.Migration

  def change do
    create table :mkb_code do
      add :code, :string
    end
  end
end
