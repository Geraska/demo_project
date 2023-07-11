defmodule DemoProject.Repo.Migrations.Departments do
  use Ecto.Migration

  def change do
    create table :departments do
      add :name, :string
    end
  end
end
