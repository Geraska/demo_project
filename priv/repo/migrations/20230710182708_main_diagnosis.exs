defmodule DemoProject.Repo.Migrations.MainDiagnosis do
  use Ecto.Migration

  def change do
    create table :main_diagnosis do
      add :diagnosis, :string
    end
  end
end
