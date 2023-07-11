defmodule DemoProject.Repo.Migrations.OperationCode do
  use Ecto.Migration

  def change do
    create table :operation_code do
      add :code, :string
    end
  end
end
