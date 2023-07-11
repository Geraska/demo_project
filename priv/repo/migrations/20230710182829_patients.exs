defmodule DemoProject.Repo.Migrations.Patients do
  use Ecto.Migration
  alias Phoenix.Socket.PoolSupervisor
  alias DemoProject.Types.{FixationMethod, OutcomeOfStay, PostoperativeRelief, Sex, Locality}

  def change do
    Sex.create_type()
    PostoperativeRelief.create_type()
    Locality.create_type()
    OutcomeOfStay.create_type()
    FixationMethod.create_type()

    create table(:patients) do
      add :org_name, :string
      add :mc_number, :string
      add :department_id, references(:departments)
      add :birth_date, :date
      add :sex, Sex.type()
      add :locality, Locality.type()
      add :income_date, :date
      add :income_days, :integer
      add :discharge_date, :date
      add :mkb_code_id, references(:mkb_code)
      add :main_diagnosis_id, references(:main_diagnosis)
      add :operation_date, :date
      add :extra_plan, :integer
      add :operation_code_id, references(:operation_code)
      add :operation_name_id, references(:operation_name)
      add :fixation_method, FixationMethod.type()
      add :implant_model_id, references(:implant_model)
      add :accompanying_illnesses_id, references(:accompanying_illnesses)
      add :postoperative_relief, PostoperativeRelief.type()
      add :outcome_of_stay, OutcomeOfStay.type()
      add :surgery_name_id, references(:surgery_name)

      timestamps()
    end
  end
end
