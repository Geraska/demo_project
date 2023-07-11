defmodule DemoProject.Repo.Migrations.OperationName do
  use Ecto.Migration

  def change do
    create table :operation_name do
      add :name, :string
    end
  end
end
